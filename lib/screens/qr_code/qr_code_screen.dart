import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_zoo/bloc/search/search_bloc.dart';
import 'package:planet_zoo/route_generator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool hasPop = false;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state.status == SearchStatus.qrCodeSuccess &&
            state.animal != null) {
          controller?.stopCamera().then((_) {
            if (!hasPop) {
              Navigator.of(context)
                  .popAndPushNamed(animalDetailRoute, arguments: state.animal);
            }
            hasPop = true;
          });
        }
      },
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                Expanded(
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 24 + MediaQuery.of(context).padding.top,
              left: 16,
              width: 24,
              height: 24,
              child: InkWell(
                onTap: Navigator.of(context).pop,
                child: const Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      context
          .read<SearchBloc>()
          .add(QrCodeScanned(id: int.parse(scanData.code ?? '')));
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
