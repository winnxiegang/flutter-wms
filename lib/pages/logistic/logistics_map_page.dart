import 'dart:convert';

import 'package:flutter_wms/models/logistics_detal_entity.dart';
import 'package:flutter_wms/provider/logistics_provide.dart';
import 'package:flutter_wms/utils/mybottom_sheet.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';

class LogisticsMapPage extends StatelessWidget {
  LogisticsDetalEntity logisticsDetalEntity;

  @override
  Widget build(BuildContext context) {
    return Consumer<LogisticsDetalProvide>(builder: (context, LogisticsDetalProvide data, child) {
      //if (data.logisticsDetalEntity?.result == null) return noDataText();
      // _logisticsDetalEntity = data.logisticsDetalEntity;
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.red,
              child: Center(
                child: Text("地图模式"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 48,
              color: Colors.white30,
              width: double.maxFinite,
              child: InkWell(
                onTap: () {
                  getdata(context);
                },
                child: Text(
                  "查看快递详情",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
  getdata(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("logisticsDetalEntity");
    if (data != null) {
      ///因为取出来的json，这里直接用进行映射成对应的map形式，下面进行class的赋值操作。
      Map<String, dynamic> responseJson = json.decode(data);
      logisticsDetalEntity = new LogisticsDetalEntity.fromJson(responseJson);
      _openModalBottomSheet(
        context,
      );
    }
  }

  Future _openModalBottomSheet(BuildContext context) async {
    showMyModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          child: ListView(
            children: <Widget>[
              _logisticDetalListHeadWidget(context),
              MyHomePage(logisticsDetalEntity: logisticsDetalEntity),
            ],
          ),
        );
      },
    );
  }

  ///  Logistics组件
  Widget _logisticDetalListHeadWidget(
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop(false);
              },
              child: Icon(
                Icons.close,
                color: Colors.black26,
                size: 30,
              ),
            ),
          ),
          Text("快递公司:    ${logisticsDetalEntity.result.company}"),
          SizedBox(
            height: 10,
          ),
          Text("快递单号:    ${logisticsDetalEntity.result.no}"),
          SizedBox(
            height: 10,
          ),
          Text("快递状态:    ${logisticsDetalEntity.result.statusDetail ?? "已签收"}"),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final LogisticsDetalEntity logisticsDetalEntity;

  const MyHomePage({
    this.logisticsDetalEntity,
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF7F9FA),
        borderRadius: BorderRadius.circular(3),
      ),
      padding: EdgeInsets.only(left: 0, right: 15, top: 15, bottom: 15),
      child: Column(
        children: _getListWeightWidget(context),
      ),
    );
  }

  /// *  getListWeight组件
  /// * _listBeautiItem直接用点击报错
  ///  listview 再嵌套listviebuild 会视图不显示，这种方法展示布局
  List<Widget> _getListWeightWidget(BuildContext context) {
    List<Widget> listWidget = new List<Widget>();
    for (int i = 0; i < widget.logisticsDetalEntity.result.xList.length; i++) {
      listWidget.add(_getRow(context, i));
    }
    return listWidget;
  }

  Widget _getRow(BuildContext context, int index) {
    String timestr = widget.logisticsDetalEntity.result.xList[index].datetime;

    Widget firstRow;
    Widget contentWidget = SizedBox();
    //跟进记录
    contentWidget = Text(
      widget.logisticsDetalEntity.result.xList[index].remark.trim() ?? "--",
      style: TextStyle(
        fontSize: 12,
      ),
      softWrap: true,
    );

    firstRow = Row(
      children: <Widget>[
        Text(timestr,
            style: TextStyle(
              fontSize: 12.0,
            ))
      ],
    );

    Widget pointWidget;
    double topSpace = 0;
    topSpace = 3;
    pointWidget = ClipOval(
      child: Container(
        width: 7,
        height: 7,
        color: Colors.grey,
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //灰色右
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 37),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: topSpace == 0 ? 4 : 0,
                    ),
                    firstRow,
                    SizedBox(
                      height: 12.0,
                    ),
                    contentWidget,
                    SizedBox(
                      height: 12.0,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                width: 37,
                bottom: 0,
                top: topSpace,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      pointWidget,
                      Expanded(
                        child: Container(
                          width: 27,
                          child: MySeparatorVertical(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MySeparatorVertical extends StatelessWidget {
  final Color color;

  const MySeparatorVertical({this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final height = constraints.constrainHeight();
        final dashWidth = 4.0;
        final dashCount = (height / (2 * dashWidth)).floor();
        print("dashCount $dashCount  height $height");

        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: 1,
              height: dashWidth,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
        );
      },
    );
  }
}
