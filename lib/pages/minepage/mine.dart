import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wms/common/app_global.dart';
import 'package:flutter_wms/provider/login_provide.dart';
import 'package:flutter_wms/utils/tire_export.dart';

//我的信息
class MineInformationPage extends StatefulWidget {
  const MineInformationPage({
    Key key,
  }) : super(key: key);

  @override
  MineInformationPageState createState() => new MineInformationPageState();
}

class MineInformationPageState extends State<MineInformationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar.buildAppBar("个人中心"),
        body: Container(
          color: CommonColors.grayBg,
          child: EasyRefresh.custom(
            topBouncing: false, //顶部不可回弹
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate([
                _headMineWidget(),
                CommonDivider.buildDivider(ScreenUtil().setHeight(20)),
                _medialMineWidget(context),
              ]))
            ],
          ),
        ));
  }

  /// headMine组件
  Widget _headMineWidget() {
    return Container(
      color: CommonColors.white,
      child: Column(
        children: <Widget>[
          SizedBox(height: ScreenUtil().setHeight(40)),
          ClipOval(
            child: Image.network(
              'https://resources.ninghao.org/images/candy-shop.jpg',
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0, ScreenUtil().setHeight(20), 0, ScreenUtil().setHeight(20)),
            child: Text( Global.user.userName??''),
          ),
        ],
      ),
    );
  }

  /// medialMine组件
  Widget _medialMineWidget(BuildContext context) {
    return Container(
      color: CommonColors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    '版本信息',
                    style: TextStyleUtils.mineTextLeftStyle,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "V ${1.00}",
                    textAlign: TextAlign.end,
                    style: TextStyleUtils.mineTextRightStyle,
                  ),
                ),
              ],
            ),
          ),
          CommonDivider.buildDivider(ScreenUtil().setHeight(1)),
          InkWell(
            onTap: () {
              _onWillPop(context);
            },
            child: ListTile(
              title: Text(
                '退出账号',
                style: TextStyleUtils.mineTextLeftStyle,
              ),
              trailing: Image.asset(
                'images/icon_list_arr.png',
                fit: BoxFit.cover,
                height: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('退出登录?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  '取消',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              new FlatButton(
                onPressed: () async => {
                  ProviderUtils.Pro<UseStatusProvide>(context).logoutStatus(),
                  Routes.router
                      .navigateTo(context, Routes.login, replace: true),
                },
                child: new Text(
                  '确定',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}
