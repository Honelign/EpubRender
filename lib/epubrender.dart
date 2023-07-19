import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EpubView extends StatefulWidget {
  final String url;

  const EpubView({Key? key, required this.url}) : super(key: key);

  @override
  State<EpubView> createState() => _EpubViewState();
}

class _EpubViewState extends State<EpubView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              // loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              // loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              // loadingPercentage = 100;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://epub-react.vercel.app/?vercelToolbarCode=Ac0c1eAdbQ_ryK3/${widget.url}'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
