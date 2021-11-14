import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:planet_zoo/theme.dart';
import 'package:any_link_preview/any_link_preview.dart';

import '../route_generator.dart';
import '../widgets/avatar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final InAppBrowser browser = InAppBrowser();
  final options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    children: [
                      Text(
                        'Good morning!',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'Nguyen My',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Actions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
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
                        .pushNamed(reportRoute),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'News',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildNews(
                          'https://www.nationalgeographic.com/animals/article/pangolin-scale-trade-shipments-growing',
                        ),
                      ),
                      Expanded(
                        child: _buildNews(
                          'https://www.savepangolins.org/news/2021/8/7/saving-pangolins-from-electric-fencing-in-south-africa',
                        ),
                      ),
                    ],
                  ),
                  _buildNews(
                    'https://www.independent.co.uk/news/world/world-elephant-day-rescuing-an-elephant-a9664956.html',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildNews(
                          'https://biglife.org/program-updates/big-life-news/african-elephants-now-listed-as-endangered?gclid=Cj0KCQiAhMOMBhDhARIsAPVml-HT4WcR9jIMhk-Nvdfs2SH9lv8sszct0RvKW37rg-N_hYhejGGDkPAaAgcjEALw_wcB',
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: _buildNews(
                          'https://www.independent.co.uk/climate-change/news/amur-leopard-scotland-critically-endangered-released-russia-a8440381.html',
                        ),
                      ),
                    ],
                  ),
                  ...[
                    'https://newsroom.wcs.org/News-Releases/articleType/ArticleView/articleId/11440/New-Study-An-Estimated-84-Highly-Endangered-Amur-Leopards-Remain-in-the-Wild-in-China-and-Russia.aspx',
                    'https://vietnamnews.vn/environment/991858/google-wwf-viet-nam-join-forces-in-saola-conservation-campaign.html',
                    'https://www.iucn.org/news/species-survival-commission/202108/iucn-ssc-experts-urge-immediate-action-find-saola-its-too-late',
                    'https://www.arcusfoundation.org/stories-of-impact/great-apes/sumatran-orangutans-benefit-action-illegal-trade-logging/?utm_term=%2Bsumatran%20%2Borangutan&utm_campaign=Arcus+%7C+Stories+of+Impact&utm_source=adwords&utm_medium=ppc&hsa_acc=2137832502&hsa_cam=823220785&hsa_grp=50062027620&hsa_ad=235543964058&hsa_src=g&hsa_tgt=kwd-388560979113&hsa_kw=%2Bsumatran%20%2Borangutan&hsa_mt=b&hsa_net=adwords&hsa_ver=3&gclid=Cj0KCQiAhMOMBhDhARIsAPVml-FhtEkDsKULTEstSy-fcVMlKFStj9r__xFOgFyeP1v36z7kDpi1Q_4aArSoEALw_wcB',
                    'https://economictimes.indiatimes.com/news/environment/flora-fauna/new-population-of-sumatran-orangutans-found-living-in-highlands/articleshow/51289660.cms'
                  ].map((e) => _buildNews(e)),
                ],
              ),
            ),
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

  Widget _buildNews(String link) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: InkWell(
        onTap: () => browser.openUrlRequest(
            urlRequest: URLRequest(url: Uri.parse(link)), options: options),
        child: IgnorePointer(
          child: AnyLinkPreview(
            link: link,
            displayDirection: UIDirection.UIDirectionVertical,
            showMultimedia: true,
            bodyMaxLines: 5,
            bodyTextOverflow: TextOverflow.ellipsis,
            titleStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            bodyStyle:
                TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14),
            errorWidget: Container(
              color: Colors.grey[300],
              child: const Text('Oops!'),
            ),
            errorImage: "https://google.com/",
            cache: const Duration(days: 7),
            backgroundColor: Colors.white,
            borderRadius: 16,
            removeElevation: false,
            boxShadow: [
              BoxShadow(blurRadius: 1, color: Colors.black.withOpacity(0.2))
            ],
          ),
        ),
      ),
    );
  }
}
