import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AnimalDetectScreen extends StatefulWidget {
  const AnimalDetectScreen({Key? key}) : super(key: key);

  @override
  State<AnimalDetectScreen> createState() => _AnimalDetectScreenState();
}

class _AnimalDetectScreenState extends State<AnimalDetectScreen> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();

    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          CameraPreview(controller),
          Positioned(
            bottom: 24 + MediaQuery.of(context).padding.bottom,
            width: 60,
            height: 60,
            child: InkWell(
              onTap: () => controller.takePicture().then((value) {
                final path = value.path;
                final data = File(path).readAsBytesSync();
                print(data);
              }),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
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
    );
  }
}
