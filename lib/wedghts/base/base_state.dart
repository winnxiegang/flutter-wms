import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wms/utils/CommonUtils.dart';

mixin BaseState<T extends StatefulWidget> on State<T>, AutomaticKeepAliveClientMixin<T> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    CommonUtils.addStatePage(T.toString());
    super.initState();
  }

  @override
  void dispose() {
    CommonUtils.romveStatePage(T.toString());
    super.dispose();
  }
}
