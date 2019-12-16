import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class ScanBottom extends StatefulWidget {
  @override
  _ScanBottomState createState() => new _ScanBottomState();
}

class _ScanBottomState extends State<ScanBottom> {
  String barTextcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(16),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new MaterialButton(
                  onPressed: scan,
                  child: new RaisedButton(
                    child: Text(
                      "点击扫描",
                    ),
                    onPressed: () {
                      scan();
                    },
                  )),
              padding: const EdgeInsets.all(8.0),
            ),
            Row(
              children: <Widget>[
                Text("扫描后信息:${barTextcode}"),
                SizedBox(width: 20),
                Container(
                  child: Flexible(
                    child: TextField(
                      cursorColor: CommonColors.mainColor,
                      onChanged: (text) {},
                      maxLength: 20,
                      style: TextStyleUtils.LoginInputTextStyle,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        hintStyle: TextStyleUtils.LoginHintTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//  扫描二维码
  Future scan() async {
    try {
      // 此处为扫码结果，barcode为二维码的内容
      String barcode = await BarcodeScanner.scan();
      ToastOk.show(msg: barcode);
      setState(() {
        barTextcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        // 未授予APP相机权限
        print('未授予APP相机权限');
      } else {
        // 扫码错误
        print('扫码错误: $e');
      }
    } on FormatException {
      // 进入扫码页面后未扫码就返回
      print('进入扫码页面后未扫码就返回');
    } catch (e) {
      // 扫码错误
      print('扫码错误: $e');
    }
  }
}
