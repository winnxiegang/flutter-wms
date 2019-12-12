import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:flutter_wms/wedghts/base/base_state.dart';
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
  final FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  bool isloading = true;

  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.shouldStart:
          setState(() {
            isloading = true;
          });
          break;
        case WebViewState.startLoad:
          setState(() {
            isloading = true;
          });
          break;
        case WebViewState.finishLoad:
          setState(() {
            isloading = false;
          });
          break;
        case WebViewState.abortLoad:
          break;
      }
    });
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEFEFEF),
        appBar: AppBar(
          title: Text(
            widget.urlTitle,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: CommonColors.mainColor,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: isloading
                  ? CupertinoActivityIndicator()
                  : IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        setState(() {
                          isloading = false;
                        });
                        flutterWebviewPlugin.reload();
                      }),
            )
          ],
          leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context)),
        ),
        body: WebviewScaffold(
          url: widget.urlString,
          withZoom: true, //允许网页缩放
          withLocalStorage: true,
          withJavascript: true, //允许执行 js 代码
        ));
  }
}
