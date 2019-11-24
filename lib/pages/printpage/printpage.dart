import 'package:flutter/material.dart';
import 'package:flutter_wms/pages/printpage/printorder_head_item.dart';
import 'package:flutter_wms/pages/printpage/printorder_list_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';
//18800005555
class PrintOrderPage extends StatefulWidget {
  const PrintOrderPage({
    Key key,
  }) : super(key: key);

  @override
  PrintOrderPageState createState() => new PrintOrderPageState();
}

class PrintOrderPageState extends State<PrintOrderPage> {
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
    return Scaffold(
      appBar: CommonAppBar.buildAppBar("打印", mBackContext: context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            PrintOrderHeadItemPage(),
            PrintOrderListItemPage(),
          ],
        ),
      ),
    );
  }
}
