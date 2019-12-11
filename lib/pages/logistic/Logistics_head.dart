import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/models/logistics_detal_entity.dart';
import 'package:flutter_wms/provider/logistics_provide.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';

class LogisticsHeadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16, right: 16),
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Text("物流公司:"),
                SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: DropdownButtonHideUnderline(
                    child: new DropdownButton(
                      hint: new Text('下拉菜单选择一个物流公司'),
                      //设置这个value之后,选中对应位置的item，
                      //再次呼出下拉菜单，会自动定位item位置在当前按钮显示的位置处
                      value: ProviderUtils.Pro<LogisticsDetalProvide>(context).logisticsName,
                      items: ProviderUtils.Pro<LogisticsDetalProvide>(context).generateItemList(),
                      onChanged: (value) {
                        ToastOk.show(msg: ProviderUtils.Pro<LogisticsDetalProvide>(context).logisticsId);
                        ProviderUtils.Pro<LogisticsDetalProvide>(context).changeLogisticsId(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text("物流单号:"),
              SizedBox(width: 20),
              Container(
                child: Flexible(
                  child: TextField(
                    cursorColor: CommonColors.mainColor,
                    onChanged: (text) {
                      //内容改变的回调
                    },
                    maxLength: 20,
                    style: TextStyleUtils.LoginInputTextStyle,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintStyle: TextStyleUtils.LoginHintTextStyle,
                      hintText: '请输入物流单号',
                    ),
                  ),
                ),
              ),
              RaisedButton(
                elevation: 1,
                onPressed: () {
                  _requestLogisticDetal(context);
                },
                child: Text(
                  "点击搜索",
                  style: TextStyle(color: Colors.white),
                ),
                color: CommonColors.mainColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///定义的data基类接受
  _requestLogisticDetal(BuildContext context) async {
    var path = "http://v.juhe.cn/exp/index?senderPhone=&receiverPhone=&dtype=&key=be0d84e149f047b1fc32b50b50d9fc7f";
    var params = {"com": Provider.of<LogisticsDetalProvide>(context).logisticsId, "no": "YT9073133846767"};
    Response response = await Dio().post(path, queryParameters: params);
    LogisticsDetalEntity logisticsDetalEntity = LogisticsDetalEntity.fromJson(json.decode(response.toString()));
    if (logisticsDetalEntity.resultcode == "200") {
      ToastOk.show(msg: "获取成功");
      setdata(logisticsDetalEntity);
      Provider.of<LogisticsDetalProvide>(context).setLogisticsDetalEntity(logisticsDetalEntity);
    } else {
      ToastOk.show(msg: logisticsDetalEntity.reason);
    }
  }

  void setdata(LogisticsDetalEntity logisticsDetalEntity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("logisticsDetalEntity", jsonEncode(logisticsDetalEntity).toString());
  }
}
