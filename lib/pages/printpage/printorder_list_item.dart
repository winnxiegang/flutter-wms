import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_wms/common/page_common.dart';
import 'package:flutter_wms/models/print_order_entity.dart';
import 'package:flutter_wms/provider/print_order_privoder.dart';
import 'package:flutter_wms/utils/refush/ball_pulse_footer.dart';
import 'package:flutter_wms/utils/refush/ball_pulse_header.dart';
import 'package:flutter_wms/utils/refush/empty_view.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class PrintOrderListItemPage extends StatefulWidget {
  int page = 1;

  @override
  PrintOrderListItemPageState createState() {
    return PrintOrderListItemPageState();
  }
}

class PrintOrderListItemPageState extends State<PrintOrderListItemPage> {
  //所有的请求 小组件 方法 都要在这个class内部
  // 总数
  EasyRefreshController _controller;
  List<PrintOrderDataResult> _listPrintOrderDataResult;
  PrintOrderEntity _printOrderEntity;
  Future<PrintOrderEntity> _futureBuildOrderList;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    onRefreshData();
  }

  ///界面数据更改后 操作事情
  @override
  void didChangeDependencies() {
    _requestOrderList();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    _listPrintOrderDataResult?.clear();
    _printOrderEntity = null;
    _futureBuildOrderList = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 657)..init(context);
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        child: FutureBuilder(
            future: _futureBuildOrderList,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return _createListView(context, snapshot);
            }),
      ),
    );
  }

  void onRefreshData() {
    widget.page = 1;
    _listPrintOrderDataResult?.clear();
    _futureBuildOrderList = _requestOrderList();
  }

  void onLoadData() {
    widget.page++;
    _futureBuildOrderList = _requestOrderList();
  }

  Widget _createListView(
      BuildContext context, AsyncSnapshot<PrintOrderEntity> snapshot) {
    if (snapshot.hasData) {
      print("logsnapshot.hasData-------------->");
      _printOrderEntity = snapshot.data;
      _printOrderEntity.result?.forEach((value) {
        _listPrintOrderDataResult.add(value);
      });
      print("log_listPrintOrderDataResult${_listPrintOrderDataResult.length}");
      return EasyRefresh.custom(
        controller: _controller,
        header: BallMyPulseHeader(),
        footer: BallMyPulseFooter(),
        emptyWidget: snapshot.data.total == 0
            ? EmptyViewUtils.emptyViewWidget(click: () {
                _controller.callRefresh();
              })
            : null,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              onRefreshData();
            });
            _controller.resetLoadState();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              onLoadData();
            });
            _controller.finishLoad(
                // ignore: null_aware_before_operator
                noMore: _listPrintOrderDataResult.length >=
                    _printOrderEntity.total);
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _listItemWidget(context, index);
              },
              childCount: _listPrintOrderDataResult.length,
            ),
          ),
        ],
      );
    } else {
      return loadingCellBox();
    }
  }

  ///定义的data基类接受
  Future<PrintOrderEntity> _requestOrderList() async {
    String tempSearch = "";
    if (context == null) {
      tempSearch =
          ProviderUtils.Pro<PrintOrderListProvide>(context)?.getSearchOen();
    }
    return await DioRequestControl().printOrderData(
        tempSearch, widget.page.toString(), "5", null,
        printError: (value) {});
  }

  Widget _listItemWidget(BuildContext context, int index) {
    return Container(
      child: InkWell(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  'OE码:',
                  style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: ScreenUtil().setHeight(16)),
                ),
                SizedBox(width: 8),
                Text(
                  _listPrintOrderDataResult[index].oeNo,
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: ScreenUtil().setHeight(22)),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Text(
                  '编码:',
                  style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: ScreenUtil().setHeight(16)),
                ),
                SizedBox(width: 8),
                Text(
                  _listPrintOrderDataResult[index].stockNo,
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: ScreenUtil().setHeight(22)),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Text(
                  '配件:',
                  style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: ScreenUtil().setHeight(16)),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _listPrintOrderDataResult[index].oeNo,
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: ScreenUtil().setHeight(22)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Text(
                  '信息:',
                  style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: ScreenUtil().setHeight(16)),
                ),
                SizedBox(width: 8),
                //Expanded子控件自适应屏幕宽高度
                Expanded(
                    child: Text(
                  _listPrintOrderDataResult[index].sparepartName,
                  overflow: TextOverflow.fade, //自动换行
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: ScreenUtil().setHeight(22)),
                )),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Text(
                  '商家:',
                  style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: ScreenUtil().setHeight(16)),
                ),
                SizedBox(width: 8),
                Text(
                  _listPrintOrderDataResult[index].brandName,
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: ScreenUtil().setHeight(22)),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            CommonDivider.buildDivider(10, mColor: Colors.black38),
          ],
        ),
      ),
    );
  }
}
