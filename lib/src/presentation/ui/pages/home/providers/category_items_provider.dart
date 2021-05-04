import 'package:flutter/cupertino.dart';
import 'package:foodon/src/presentation/utils/enums.dart';

class CategoryItemsProvider extends ChangeNotifier {
  CategoryItemsEnum id = CategoryItemsEnum.kebab;
  void setId(CategoryItemsEnum id) {
    this.id = id;
    notifyListeners();
  }
}
