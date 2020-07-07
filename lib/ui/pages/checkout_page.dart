import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:meta/meta.dart';

class CheckoutPage extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final String paymentUrl;

  CheckoutPage({@required this.paymentUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Builder(builder: (context) {
        return WebView(
          initialUrl: this.paymentUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        );
      })),
    );
  }
}
