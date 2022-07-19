import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPemerintah extends StatefulWidget {
  @override
  _WebViewPemerintah createState() => _WebViewPemerintah();
}

class _WebViewPemerintah extends State<WebViewPemerintah> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  void BackButton() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Informasi Pendukung Pemerintah',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff2D2926),
            leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () {
              Navigator.pop(context);
            },
            ),
            title: Text('Informasi Pendukung Pemerintah'),
          ),
          body: WebView(
              initialUrl: 'https://kawalcovid19.id/pemerintah-daerah',
              javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated:
                  (WebViewController webViewController) {
                _controller.complete(webViewController);
              }
          )
      ),
    );
  }
}
