import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:flutter_wms/wedghts/base/base_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/tire_export.dart';

class FLWebviewPage extends StatefulWidget {
  FLWebviewPage({
    Key key,
    this.urlString,
    this.urlTitle,
  }) : super(key: key);

  final urlString;
  final urlTitle;

  @override
  FLWebviewPageState createState() => new FLWebviewPageState();
}

class FLWebviewPageState extends State<FLWebviewPage>
    with AutomaticKeepAliveClientMixin<FLWebviewPage>, BaseState<FLWebviewPage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
        backgroundColor: CommonColors.mainColor,
        actions: <Widget>[Container()],
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 32,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          widget.urlTitle,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: WebView(
        initialUrl: widget.urlString,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
      ),
    );
  }
}
