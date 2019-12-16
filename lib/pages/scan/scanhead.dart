import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanHeadPage extends StatefulWidget {
  const ScanHeadPage({
    Key key,
  }) : super(key: key);

  @override
  ScanHeadPageState createState() => new ScanHeadPageState();
}

class ScanHeadPageState extends State<ScanHeadPage> {
  String qrData = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: 销毁
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("物品信息:"),
              SizedBox(width: 20),
              Container(
                child: Flexible(
                  child: TextField(
                    cursorColor: CommonColors.mainColor,
                    onChanged: (text) {
                      //内容改变的回调
                      setState(() {
                        qrData = text;
                      });
                    },
                    maxLength: 20,
                    style: TextStyleUtils.LoginInputTextStyle,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintStyle: TextStyleUtils.LoginHintTextStyle,
                      hintText: '请输入物品信息',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Offstage(
            offstage: qrData.isEmpty,
            child: QrImage(
              data: qrData,
              size: 200,
              errorStateBuilder: (cxt, err) {
                return Container(
                  child: Center(
                    child: Text(
                      "暂无二维码信息",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
