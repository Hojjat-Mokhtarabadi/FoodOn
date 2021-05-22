import 'package:flutter/cupertino.dart';

class OrdersCountProvider extends ChangeNotifier {
  int count = 1;
  int foodId = 0;
  void setFoodId({int id}) {
    this.foodId = id;
    notifyListeners();
  }

  void updateCount({int count}) {
    this.count = count;
    //notifyListeners();
  }
}
