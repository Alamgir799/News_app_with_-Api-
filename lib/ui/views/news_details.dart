import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  var data;
  NewsDetails(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
      ),
      body: WebView(
        initialUrl: data!.url ?? 'https://flutter.dev',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
