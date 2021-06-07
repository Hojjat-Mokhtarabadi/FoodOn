import 'package:flutter/cupertino.dart';

class FoodInfoProvider extends ChangeNotifier {
  int id;
  String name;
  String detail;
  double price;
  double score;
  int categoryId;

  void setFoodInfo({
    int id,
    String name,
    String detail,
    double price,
    double score,
    int categoryId,
  }) {
    this.id = id;
    this.name = name;
    this.detail = detail;
    this.price = price;
    this.score = score;
    this.categoryId = categoryId;
    notifyListeners();
  }
}
