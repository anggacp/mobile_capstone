import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPlasma extends StatefulWidget {
  @override
  _WebViewPlasma createState() => _WebViewPlasma();
}

class _WebViewPlasma extends State<WebViewPlasma> {
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
      title: 'Informasi Plasma Konvalesen',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff2D2926),
            leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () {
              Navigator.pop(context);
            },
            ),
            title: Text('Informasi Plasma Konvalesen'),
          ),
          body: WebView(
            initialUrl: 'https://pmi.or.id/17/07/2021/berita-utama/organisasi/seputar-plasma-konvalesen',
          )
      ),
    );
  }
}
