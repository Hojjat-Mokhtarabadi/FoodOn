import 'package:flutter/cupertino.dart';

class CartInfoProvider extends ChangeNotifier {
  int cartId;
  void setInfo({int cartId}) {
    this.cartId = cartId;
    notifyListeners();
  }
}
