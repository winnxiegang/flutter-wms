import 'package:flutter_wms/utils/tire_export.dart';

class PrintOrderListProvide extends ChangeNotifier {
  String searchOen = "";

  void setSearchOen(String searchOen) {
    this.searchOen = searchOen;
    notifyListeners();
  }

  String getSearchOen() => searchOen ?? "";
}
