import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';

/**
 * 快递接口:http://www.kuaidi100.com/query?type=快递公司代号&postid=快递单号
    ps:快递公司编码:申通="shentong" EMS="ems" 顺丰="shunfeng" 圆通="yuantong"
    中通="zhongtong" 韵达="yunda" 天天="tiantian" 汇通="huitongkuaidi" 全峰="quanfengkuaidi" 德邦="debangwuliu" 宅急送="zhaijisong"
 */
class LogisticsHeadPage extends StatelessWidget {
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
                  value: "张三",
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
    return new List<DropdownMenuItem>.generate(9, (i) => new DropdownMenuItem(child: new Text('$i'), value: '$i'));
    List<DropdownMenuItem> items = new List();
    for (int i = 0; i < 10; i++) {
      DropdownMenuItem item1 = new DropdownMenuItem(value: '张三', child: new Center(child: Text('张三')));
      //items?.add(item1);
      items?.add(new DropdownMenuItem(value: '张三', child: new Center(child: Text('张三'))));
    }
    return items;
  }
}

class DropDownStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DropDownState();
}

class DropDownState extends State<DropDownStateWidget> {
  //下拉菜单item点击之后获取到的值
  var selectItemValue;

  /*DropDownState(){
    selectItemValue=getDropdownMenuItem()[0].value;
  }*/
  @override
  Widget build(BuildContext context) {
    //DropdownButtonHideUnderline：下拉菜单展示的内容处没有下划线
    return new DropdownButtonHideUnderline(
      child: new DropdownButton(
        hint: new Text('下拉菜单选择一个人名'),
        //设置这个value之后,选中对应位置的item，
        //再次呼出下拉菜单，会自动定位item位置在当前按钮显示的位置处
        value: "1",
        items: generateItemList(),
        onChanged: (T) {
          setState(() {
            selectItemValue = T;
          });
        },
      ),
    );
  }

  List<DropdownMenuItem> generateItemList() {
    // return new List<DropdownMenuItem>.generate(9, (i) => new DropdownMenuItem(child: new Text('$i'), value: '$i'));
    List<DropdownMenuItem> items = new List();
    for (int i = 0; i < 10; i++) {
      DropdownMenuItem item1 = new DropdownMenuItem(value: '$i', child: new Center(child: Text('$i')));
      items?.add(item1);
    }
    return items;
  }
}
