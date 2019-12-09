import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';

/**
 * 快递接口:http://www.kuaidi100.com/query?type=快递公司代号&postid=快递单号
    ps:快递公司编码:申通="shentong" EMS="ems" 顺丰="shunfeng" 圆通="yuantong"
    中通="zhongtong" 韵达="yunda" 天天="tiantian" 汇通="huitongkuaidi" 全峰="quanfengkuaidi" 德邦="debangwuliu" 宅急送="zhaijisong"
 */
class LogisticsHeadPage extends StatelessWidget {
  var stringList = [
    "顺丰快递",
    "申通快递",
    "圆通速递",
    "韵达快递",
    "天天快递",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text("物流公司"),
              ),
              DropdownButtonHideUnderline(
                child: new DropdownButton(
                  hint: new Text('下拉菜单选择一个物流公司'),
                  //设置这个value之后,选中对应位置的item，
                  //再次呼出下拉菜单，会自动定位item位置在当前按钮显示的位置处
                  value: "顺丰快递",
                  items: generateItemList(),
                  onChanged: (T) {},
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text("物流公司"),
            ],
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem> generateItemList() {
    List<DropdownMenuItem> items = new List();
    stringList.forEach((value) {
      items.add(DropdownMenuItem(value: value, child: new Center(child: Text(value))));
    });

    return items;
  }
}
