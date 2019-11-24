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
  List<PrintOrderDataResult> _listPrintOrderDataResult = []; //总数据
  PrintOrderEntity _printOrderEntity; //每次请求的数据
  Future<PrintOrderEntity> _futureBuildOrderList;
  bool isfirstRefush = true;

  @override
  void initState() {
    isfirstRefush = true;
    _controller = EasyRefreshController();
    _futureBuildOrderList = _requestOrderList();
    super.initState();
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
    _futureBuildOrderList = _requestOrderList();
  }

  void onLoadData() {
    widget.page++;
    _futureBuildOrderList = _requestOrderList();
  }

  Widget _createListView(
      BuildContext context, AsyncSnapshot<PrintOrderEntity> snapshot) {
    if (isfirstRefush) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
        case ConnectionState.waiting:
        case ConnectionState.active:
          // 显示正在加载
          return loadingCellBox();
        case ConnectionState.done:
          // 提示错误信息
          if (snapshot.hasError) {
            return loadingErrorClick(() {
              onRefreshData();
              ToastOk.show(msg: snapshot.toString());
            });
          }
      }
    } else {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
        case ConnectionState.waiting:
        case ConnectionState.active:
        case ConnectionState.done:
          // 提示错误信息
          if (snapshot.hasError) {
            return loadingErrorClick(() {
              onRefreshData();
            });
          }
      }
    }
//todo 数据判断
    if (snapshot.hasData) {
      isfirstRefush = false;
      _printOrderEntity = snapshot.data;
      _printOrderEntity.result?.forEach((value) {
        _listPrintOrderDataResult.add(value);
      });
      if (_listPrintOrderDataResult.length >= _printOrderEntity.total) {
        _controller.finishLoad(success: true, noMore: true);
      }
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
              isfirstRefush = false;
            });
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              onLoadData();
            });
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
    }
  }

  ///定义的data基类接受
  Future<PrintOrderEntity> _requestOrderList() async {
    if (widget.page == 1) {
      _listPrintOrderDataResult.clear();
    }
    String oem = "";
    if (mounted) {
      oem = ProviderUtils.Pro<PrintOrderListProvide>(context)?.getSearchOen();
    }
    return await DioRequestControl().printOrderData(
        oem, widget.page.toString(), "10", null,
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
