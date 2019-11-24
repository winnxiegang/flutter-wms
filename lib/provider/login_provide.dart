import 'package:flutter/material.dart';

class LoginProvide extends ChangeNotifier {
  String useWorld = "";
  String usePhone = "";

  void setUseWorld(String useWorld) {
    this.useWorld = useWorld;
    notifyListeners();
  }

  String getUseWorld() {
    return useWorld;
  }

  void setUsePhone(String usePhone) {
    this.usePhone = usePhone;
    notifyListeners();
  }

  String getUsePhone() {
    return usePhone;
  }
}
