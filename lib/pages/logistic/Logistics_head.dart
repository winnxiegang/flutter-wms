import 'package:flutter/material.dart';
import 'package:flutter_wms/provider/logistics_provide.dart';
import 'package:flutter_wms/utils/tire_export.dart';

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
                  value: ProviderUtils.Pro<LogisticsDetalProvide>(context).logisticsName,
                  items: ProviderUtils.Pro<LogisticsDetalProvide>(context).generateItemList(),
                  onChanged: (value) {
                    ProviderUtils.Pro<LogisticsDetalProvide>(context).changeLogisticsId(value);
                  },
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
}
