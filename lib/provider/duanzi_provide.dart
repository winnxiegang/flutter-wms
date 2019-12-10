import 'package:flutter/cupertino.dart';
import 'package:flutter_wms/models/duanzi_entity.dart';

class DuanZiProvide extends ChangeNotifier {
  ///因为实时刷新数据 不同类 取的字段不一样公用Provide 要分别定义各自请求的数据类
  // 文字的数据类
  List<DuanziResult> _listHappyText = [];

  List<DuanziResult> get listHappyTexttem => _listHappyText;

  void addHappyTextList(List<DuanziResult> list, int currentPage) {
    if (list == null) {
      return;
    }
    if (currentPage == 1) {
      _listHappyText = list;
    } else {
      _listHappyText.addAll(list);
    }
    notifyListeners();
  }

  // 图片的数据类
  List<DuanziResult> _listHappyPic = [];

  List<DuanziResult> get listHappyPicItem => _listHappyPic;

  void addHappyPicList(List<DuanziResult> list, int currentPage) {
    if (list == null) {
      return;
    }
    if (currentPage == 1) {
      _listHappyPic = list;
    } else {
      _listHappyPic.addAll(list);
    }
    notifyListeners();
  }

  // 图片的数据类
  List<DuanziResult> _listHappyGif = [];

  List<DuanziResult> get listHappyGifItem => _listHappyGif;

  void addHappyGifList(List<DuanziResult> list, int currentPage) {
    if (list == null) {
      return;
    }
    if (currentPage == 1) {
      _listHappyGif = list;
    } else {
      _listHappyGif.addAll(list);
    }
    notifyListeners();
  }

  // 视频的数据类
  List<DuanziResult> _listHappyVide = [];

  List<DuanziResult> get listHappyVideItem => _listHappyVide;

  void addHappyVideoList(List<DuanziResult> list, int currentPage) {
    if (list == null) {
      return;
    }
    if (currentPage == 1) {
      _listHappyVide = list;
    } else {
      _listHappyVide.addAll(list);
    }
    notifyListeners();
  }

//底部PageView位置
  int clickPageViewPosition = 0;

  void changePageViewClickPosition(int isClickVideo) {
    clickPageViewPosition = isClickVideo;
    notifyListeners();
  }

  bool _isSlidingPageView = true;

  bool get isSlidingPageView => _isSlidingPageView;

  //滑动判断
  void setSlidingPageView(bool isSlidingPageView) {
    _isSlidingPageView = isSlidingPageView;
    notifyListeners();
  }
}
