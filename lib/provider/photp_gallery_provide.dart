import 'package:flutter/cupertino.dart';

class PhotpGalleryProvide extends ChangeNotifier {
  List<String> _photoList = [];
  int _index = 0;

  List<String> get photoList => _photoList;

  int get index => _index;

//改变查看图片方式
  void addHappyList(List<String> list, int index) {
    if (list == null) {
      return;
    }
    _photoList = list;
    _index = _index;
    notifyListeners();
  }
}
