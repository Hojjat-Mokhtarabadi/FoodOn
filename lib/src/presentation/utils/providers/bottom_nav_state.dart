import 'package:flutter/cupertino.dart';

class BottomNavStateProvider extends ChangeNotifier {
  bool shouldHide = false;
  void setHideState({bool shouldHide}) {
    this.shouldHide = shouldHide;
    notifyListeners();
  }
}
