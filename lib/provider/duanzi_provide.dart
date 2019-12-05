import 'package:flutter/cupertino.dart';
import 'package:flutter_wms/models/duanzi_entity.dart';

class DuanZiProvide extends ChangeNotifier {
  List<DuanziResult> _listHappyzi = [];

  List<DuanziResult> get listHappyItem => _listHappyzi;
  int clickPosition = 0;

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
  }

  void changeClickPosition(int isClickVideo) {
    clickPosition = isClickVideo;
    notifyListeners();
  }
}
