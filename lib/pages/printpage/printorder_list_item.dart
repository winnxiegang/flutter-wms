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
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PrintOrderListItemPage extends StatefulWidget {
  @override
  PrintOrderListItemPageState createState() => new PrintOrderListItemPageState();
}

class PrintOrderListItemPageState extends State<PrintOrderListItemPage> {
  final List<PrintOrderDataResult> _goodsList = [];
  PrintOrderEntity _printOrderEntity;
  Future _futureCouponList;
  int currentPage = 1;
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    _futureCouponList = _requestOrderList();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PrintOrderEntity>(
        future: _futureCouponList,
        builder: (context, data) {
          if (data.hasData) {
            _printOrderEntity = data.data;
            if (_printOrderEntity.result.length == 0) {
              return noDataText();
            }
            Future.delayed(Duration.zero).then((e) {
              Provider.of<PrintOrderListProvide>(context).addGoodsList(_printOrderEntity.result, currentPage);
            });
            _goodsList
              ..clear()
              ..addAll(Provider.of<PrintOrderListProvide>(context).goodsList);
          } else {
            return loadingCellBox();
          }
          /**
              SmartRefresher 嵌套子布局使用  ListView 等view 一定要限制子布局View 的滑动问题
           */
          return Expanded(
            child: SmartRefresher(
              enablePullUp: true,
              enablePullDown: true,
              controller: _refreshController,
              header: ClassicHeader(
                idleText: "下拉中",
                releaseText: "松手加载",
                refreshingText: "加载中",
                completeText: "加载完成",
              ),
              footer: ClassicFooter(
                idleText: "上拉加载更多",
                noDataText: "没有更多",
                loadStyle: LoadStyle.ShowAlways,
                loadingText: "加载中",
              ),
              onRefresh: () {
                Future.delayed(Duration(milliseconds: 2000), () {
                  onRefreshData();
                  _refreshController.refreshCompleted();
                });
              },
              onLoading: () async {
                Future.delayed(Duration(milliseconds: 2000), () {
                  onLoadData(context);
                });
              },
              child: ListView.builder(itemBuilder: _listItemWidget, itemCount: _goodsList.length),
            ),
          );
        });
  }

  ///定义的data基类接受
  Future<PrintOrderEntity> _requestOrderList() async {
    return await DioRequestControl().printOrderData(
        ProviderUtils.Pro<PrintOrderListProvide>(context)?.searchOen, currentPage.toString(), "1", null,
        printError: (value) {});
  }

  void onRefreshData() {
    setState(() {
      currentPage = 1;
      _requestOrderList();
    });
  }

  void onLoadData(BuildContext context) {
    _printOrderEntity.total >= Provider.of<PrintOrderListProvide>(context).goodsList.length
        ? _refreshController.loadComplete()
        : _refreshController.loadNoData();

    setState(() {
      currentPage++;
      _requestOrderList();
    });
  }

  Widget _listItemWidget(BuildContext context, int index) {
    return InkWell(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text(
                'OE码:',
                style: TextStyle(color: Color(0xFF888888), fontSize: ScreenUtil().setHeight(16)),
              ),
              SizedBox(width: 8),
              Text(
                _goodsList[index].oeNo,
                style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setHeight(22)),
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
                style: TextStyle(color: Color(0xFF888888), fontSize: ScreenUtil().setHeight(16)),
              ),
              SizedBox(width: 8),
              Text(
                _goodsList[index].stockNo,
                style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setHeight(22)),
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
                style: TextStyle(color: Color(0xFF888888), fontSize: ScreenUtil().setHeight(16)),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  _goodsList[index].oeNo,
                  style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setHeight(22)),
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
                style: TextStyle(color: Color(0xFF888888), fontSize: ScreenUtil().setHeight(16)),
              ),
              SizedBox(width: 8),
              //Expanded子控件自适应屏幕宽高度
              Expanded(
                  child: Text(
                _goodsList[index].sparepartName,
                overflow: TextOverflow.fade, //自动换行
                style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setHeight(22)),
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
                style: TextStyle(color: Color(0xFF888888), fontSize: ScreenUtil().setHeight(16)),
              ),
              SizedBox(width: 8),
              Text(
                _goodsList[index].brandName,
                style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setHeight(22)),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          CommonDivider.buildDivider(10, mColor: Colors.black38),
        ],
      ),
    );
  }
}
