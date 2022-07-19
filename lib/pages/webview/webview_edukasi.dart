import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewEdukasi extends StatefulWidget {
  @override
  _WebViewEdukasi createState() => _WebViewEdukasi();
}

class _WebViewEdukasi extends State<WebViewEdukasi> {
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
      title: 'Informasi Edukasi Covid',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff2D2926),
            leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () {
              Navigator.pop(context);
            },
            ),
            title: Text('Informasi Edukasi Covid'),
          ),
          body: WebView(
            initialUrl: 'https://covid19.go.id/edukasi/pengantar',
          )
      ),
    );
  }
}
