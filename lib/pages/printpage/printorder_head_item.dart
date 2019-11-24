import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/provider/print_order_privoder.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class PrintOrderHeadItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: CommonColors.mainColor,
        ),
        height: ScreenUtil().setHeight(80),
        padding: EdgeInsets.all(
          ScreenUtil().setHeight(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: ScreenUtil().setHeight(16),
              ),
              Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              Container(
                child: Flexible(
                    child: TextField(
                  maxLength: 20,
                  style: TextStyleUtils.LoginInputTextStyle,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    ProviderUtils.Pro<PrintOrderListProvide>(context,refushListen: true)
                        ?.setSearchOen(value);
                  },
                  onSubmitted: (value) {
                    ProviderUtils.Pro<PrintOrderListProvide>(context,refushListen: true)
                        ?.setSearchOen(value);
                  },
                  decoration: InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
//                    fillColor: Colors.white,
//                    filled: true,
                    hintStyle: TextStyle(
                      color: Color(0XFF333333),
                      fontSize: ScreenUtil().setHeight(16),
                    ),
                    hintText: '请输入OEM搜索',
                  ),
                )),
              ),
            ],
          ),
        ));
  }
}
