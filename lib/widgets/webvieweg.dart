import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https://www.designexamguide.co.in/",
      javascriptMode: JavascriptMode.unrestricted,
      onWebResourceError: (error) {
        print("error");
        LinearProgressIndicator();
      },
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.contains("mailto:")) {
          _launchURL(request.url);
          return NavigationDecision.prevent;
        } else if (request.url.contains("tel:")) {
          _launchURL(request.url);
          return NavigationDecision.prevent;
        }
        else if(request.url.contains("facebook:")){

          _launchURL(request.url);
        }
        return NavigationDecision.navigate;
      },
    );
  }
}
