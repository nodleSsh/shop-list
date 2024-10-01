import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final String link;
  const WebView({super.key, required this.link});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {


  WebViewController getToWebView(String link){
    final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('${link}'));
    return controller;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebViewWidget(
        controller: getToWebView(widget.link),
      ),
    );
  }
}
