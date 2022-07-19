import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewCovid extends StatefulWidget {
  @override
  _WebViewCovid createState() => _WebViewCovid();
}

class _WebViewCovid extends State<WebViewCovid> {
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
      title: 'Informasi Covid-19',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2D2926),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () {
              Navigator.pop(context);
          },
          ),
          title: Text('Informasi Covid-19'),
        ),
          body: WebView(
            initialUrl: 'https://www.alodokter.com/covid-19',
          )
      ),
    );
  }
}
