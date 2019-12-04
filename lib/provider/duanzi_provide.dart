import 'package:flutter/cupertino.dart';
import 'package:flutter_wms/models/duanzi_entity.dart';
import 'package:flutter_wms/utils/toast_util.dart';

class DuanZiProvide extends ChangeNotifier {
  List<DuanziResult> _listHappyzi = [];

  List<DuanziResult> get listHappyItem => _listHappyzi;

  void addHappyList(List<DuanziResult> list, int currentPage) {
    if (list == null) {
      return;
    }
    if (currentPage == 1) {
      _listHappyzi = list;
    } else {
      _listHappyzi.addAll(list);
    }
    notifyListeners();
    print("页码${currentPage.toString()}_goodsList${_listHappyzi.length}");
  }
}
