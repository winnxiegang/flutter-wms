import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/common/page_common.dart';
import 'package:flutter_wms/models/duanzi_entity.dart';
import 'package:flutter_wms/provider/duanzi_provide.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HanppyListTextPage extends StatefulWidget {
  const HanppyListTextPage({
    Key key,
  }) : super(key: key);

  @override
  HanppyListTextPageState createState() => new HanppyListTextPageState();
}

class HanppyListTextPageState extends State<HanppyListTextPage> {
  List<DuanziResult> _goodsList = [];
  Future _futureCouponList;
  int currentPage = 1;
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    _futureCouponList = _requestHappyList();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /**
     * FutureBuilder 里面不能进行list的 add或者addall 方法
     */
    return FutureBuilder<DuanziEntity>(
        future: _futureCouponList,
        builder: (context, data) {
          if (data.hasData) {
            _goodsList = Provider.of<DuanZiProvide>(context).listHappyItem;
            if (_goodsList.length == 0) return noDataText();
            if (_goodsList.length != 0 && data.data.result.length == 0) _refreshController.loadNoData();
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
                idleText: "加载完成",
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
                  onLoadData();
                  _refreshController.loadComplete();
                });
              },
              child: ListView.builder(itemBuilder: _listItemWidget, itemCount: _goodsList.length),
            ),
          );
        });
  }

  ///定义的data基类接受
  Future<DuanziEntity> _requestHappyList() async {
    var path = "https://api.apiopen.top/getJoke?";
    var params = {"page": currentPage.toString(), "count": "10", "type": "text"};
    Response response = await Dio().post(path, queryParameters: params);
    DuanziEntity duanziEntity = DuanziEntity.fromJson(json.decode(response.toString()));
    Provider.of<DuanZiProvide>(context).addHappyList(duanziEntity.result, currentPage);
    return DuanziEntity.fromJson(json.decode(response.toString()));
  }

  void onRefreshData() {
    currentPage = 1;
    _requestHappyList();
  }

  void onLoadData() {
    setState(() {
      currentPage++;
      _requestHappyList();
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
              Expanded(
                child: Text(
                  _goodsList[index].text,
                  style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setHeight(22)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
