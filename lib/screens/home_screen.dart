import 'package:flutter/material.dart';
import 'package:planet_zoo/theme.dart';
import 'package:any_link_preview/any_link_preview.dart';

import '../route_generator.dart';
import '../widgets/avatar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const AvatarWidget(),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Good morning!',
                        style: TextStyle(
                          color: lightPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Nguyen My',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  _buildButton(
                    context,
                    text: 'Scan QR Code',
                    color: primaryColor3,
                    icon: Icons.qr_code_scanner,
                    onTap: () => Navigator.of(context, rootNavigator: true)
                        .pushNamed(qrCodeRoute),
                  ),
                  _buildButton(
                    context,
                    text: 'Detect Animal',
                    color: primaryColor2,
                    icon: Icons.photo_camera,
                    onTap: () => Navigator.of(context, rootNavigator: true)
                        .pushNamed(animalDetectRoute),
                  ),
                  _buildButton(
                    context,
                    text: 'Report Form',
                    color: warningColor,
                    icon: Icons.report,
                    onTap: () => Navigator.of(context, rootNavigator: true)
                        .pushNamed(qrCodeRoute),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnyLinkPreview(
                link:
                    "https://vnexpress.net/de-xuat-tat-ca-quan-duoc-ban-bia-ruou-4385339.html",
                displayDirection: UIDirection.UIDirectionVertical,
                showMultimedia: true,
                bodyMaxLines: 5,
                bodyTextOverflow: TextOverflow.ellipsis,
                titleStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                bodyStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                errorBody: 'Show my custom error body',
                errorTitle: 'Show my custom error title',
                errorWidget: Container(
                  color: Colors.grey[300],
                  child: const Text('Oops!'),
                ),
                errorImage: "https://google.com/",
                cache: const Duration(days: 7),
                backgroundColor: Colors.grey[300],
                borderRadius: 12,
                removeElevation: false,
                boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.grey)],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String text,
    required Color color,
    required IconData icon,
    required Function() onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [color, color.withAlpha(160)],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: ClipOval(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: color.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Icon(
                          icon,
                          color: color,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
