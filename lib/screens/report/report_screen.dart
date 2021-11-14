import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:planet_zoo/route_generator.dart';
import 'package:planet_zoo/screens/map/map_screen.dart';
import 'package:planet_zoo/theme.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String? imagePath;
  LatLng? currentLocation;
  TextEditingController? positionController;

  @override
  void initState() {
    positionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    positionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Form'),
        backgroundColor: Colors.transparent,
        foregroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              _buildTitle('Report Title'),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    counterText: '',
                    filled: true,
                    fillColor: primaryBackgroundColor,
                    hintText: 'Enter your title',
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              _buildTitle('Image'),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () async {
                  final path = await _selectSourceAndPickImage(context);
                  if (path != null) {
                    setState(() {
                      imagePath = path;
                    });
                  }
                },
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: primaryBackgroundColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  height: 200,
                  child: imagePath == null
                      ? Icon(
                          Icons.image,
                          size: 56,
                          color: Colors.black.withOpacity(0.5),
                        )
                      : Image.file(
                          File(imagePath!),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              _buildTitle('Report Content'),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                maxLines: 6,
                maxLength: 100,
                decoration: const InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: primaryBackgroundColor,
                  hintText: 'Tell us more information',
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              _buildTitle('Report Location'),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 40,
                child: InkWell(
                  onTap: () async {
                    var status = await Permission.location.status;
                    if (status.isPermanentlyDenied) return;
                    if (status.isDenied) {
                      status = await Permission.location.request();
                      if (!(status.isDenied || status.isPermanentlyDenied)) {
                        LatLng? location = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const MapScreen()));
                        positionController?.text =
                            '${location?.latitude}, ${location?.longitude}';
                        setState(() {
                          currentLocation = location;
                        });
                      }
                    } else {
                      LatLng? location = await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const MapScreen()));
                      positionController?.text =
                          '${location?.latitude}, ${location?.longitude}';
                      setState(() {
                        currentLocation = location;
                      });
                    }
                  },
                  child: IgnorePointer(
                    child: TextField(
                      controller: positionController,
                      decoration: const InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: primaryBackgroundColor,
                        hintText: 'Choose location',
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: MaterialButton(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Send Report Successfully'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 3),
                      ),
                    );
                    await Future.delayed(const Duration(seconds: 3));
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Send Report',
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }
}

Future<T?> _showCustomModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  double? elevation,
  ShapeBorder? shape,
  Color? barrierColor,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  RouteSettings? routeSettings,
}) async {
  return showModalBottomSheet(
    context: context,
    builder: (context) => _BottomSheetBackground(child: builder(context)),
    backgroundColor: Colors.transparent,
    elevation: elevation,
    shape: shape,
    clipBehavior: Clip.hardEdge,
    barrierColor: barrierColor,
    isScrollControlled: true,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    routeSettings: routeSettings,
  );
}

class ImagePickerBottomSheet extends StatefulWidget {
  const ImagePickerBottomSheet({Key? key}) : super(key: key);

  @override
  _ImagePickerBottomSheetState createState() => _ImagePickerBottomSheetState();
}

class _ImagePickerBottomSheetState extends State<ImagePickerBottomSheet> {
  Widget buildSource({
    required String title,
    required IconData icon,
    required ImageSource source,
  }) {
    return InkWell(
      onTap: () async {
        final result = await ImagePicker().pickImage(source: source);
        Navigator.of(context).pop(result?.path);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 18),
        Text(
          'Choose Image',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        const Divider(),
        buildSource(
          title: 'From camera',
          icon: Icons.camera_alt,
          source: ImageSource.camera,
        ),
        const Divider(),
        buildSource(
          title: 'From gallery',
          icon: Icons.image,
          source: ImageSource.gallery,
        ),
        const SizedBox(height: 12)
      ],
    );
  }
}

Future<String?> _selectSourceAndPickImage(BuildContext context) {
  return _showCustomModalBottomSheet(
    context: context,
    builder: (_) => const ImagePickerBottomSheet(),
  );
}

class _BottomSheetBackground extends StatelessWidget {
  final Widget? child;

  const _BottomSheetBackground({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 48,
          height: 6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24), topLeft: Radius.circular(24))),
          child: child,
        ),
      ],
    );
  }
}
