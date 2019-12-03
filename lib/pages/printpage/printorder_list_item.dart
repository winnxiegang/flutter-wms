import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_wms/common/page_common.dart';
import 'package:flutter_wms/models/print_order_entity.dart';
import 'package:flutter_wms/provider/print_order_privoder.dart';
import 'package:flutter_wms/utils/refush/ball_pulse_footer.dart';
import 'package:flutter_wms/utils/refush/ball_pulse_header.dart';
import 'package:flutter_wms/utils/refush/empty_view.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';

class PrintOrderListItemPage extends StatefulWidget {
  @override
  PrintOrderListItemPageState createState() {
    return PrintOrderListItemPageState();
  }
}

class PrintOrderListItemPageState extends State<PrintOrderListItemPage> {
  //所有的请求 小组件 方法 都要在这个class内部
  // 总数
  EasyRefreshController _controller;
  Future<PrintOrderEntity> _futureBuildOrderList;
  List<PrintOrderDataResult> _list;
  int currentPage = 1;

  @override
  void initState() {
    _controller = EasyRefreshController();
    _futureBuildOrderList = _requestOrderList();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
    setState(() {
      currentPage = 1;
      _futureBuildOrderList = _requestOrderList();
    });
  }

  void onLoadData() {
    setState(() {
      currentPage++;
      _futureBuildOrderList = _requestOrderList();
    });
  }

  Widget _createListView(
      BuildContext context, AsyncSnapshot<PrintOrderEntity> snapshot) {
    if (ProviderUtils.Pro<PrintOrderListProvide>(context).isNeedLoadCircl) {
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
      if (snapshot.data?.result?.length == 0) {
        return noDataText();
      }
      _list = snapshot.data.result;
      Future.delayed(Duration.zero).then((e) {
        ProviderUtils.Pro<PrintOrderListProvide>(context)
            ?.addGoodsList(_list, currentPage);
      });

      if (ProviderUtils.Pro<PrintOrderListProvide>(context)
          .isLoadEnd(snapshot.data.total)) {
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
            ProviderUtils.Pro<PrintOrderListProvide>(context)
                ?.setLoadCircl(true);
            onRefreshData();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            ProviderUtils.Pro<PrintOrderListProvide>(context)
                ?.setLoadCircl(false);
            onLoadData();
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _listItemWidget(context, index);
              },
              childCount: ProviderUtils.Pro<PrintOrderListProvide>(context)
                  .goodsList
                  .length,
            ),
          ),
        ],
      );
    }
  }

  ///定义的data基类接受
  Future<PrintOrderEntity> _requestOrderList() async {
    return await DioRequestControl().printOrderData(
        ProviderUtils.Pro<PrintOrderListProvide>(context)?.searchOen,
        currentPage.toString(),
        "5",
        null,
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
                  ProviderUtils.Pro<PrintOrderListProvide>(context)
                      .goodsList[index]
                      .oeNo,
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
                  ProviderUtils.Pro<PrintOrderListProvide>(context)
                      .goodsList[index]
                      .stockNo,
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
                    ProviderUtils.Pro<PrintOrderListProvide>(context)
                        .goodsList[index]
                        .oeNo,
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
                  ProviderUtils.Pro<PrintOrderListProvide>(context)
                      .goodsList[index]
                      .sparepartName,
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
                  ProviderUtils.Pro<PrintOrderListProvide>(context)
                      .goodsList[index]
                      .brandName,
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
