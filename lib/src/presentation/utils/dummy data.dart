import 'package:flutter/cupertino.dart';
import 'package:foodon/src/presentation/ui/pages/cart/cart_orders.dart';
import 'package:foodon/src/presentation/utils/enums.dart';

import '../ui/pages/home/category_items.dart';

class Dummydata {
  // List<Widget> foodsList = [
  //   FoodCard(
  //     foodName: 'پاستا',
  //     price: "1500",
  //     rate: "4.5",
  //     foodPic: 'assets/images/food_images/pizza3.jpg',
  //   ),
  //   FoodCard(
  //     foodName: 'برگر',
  //     price: "1500",
  //     rate: "4.5",
  //     foodPic: 'assets/images/food_images/burger.jpg',
  //   ),
  //   FoodCard(
  //     foodName: 'یه برگر دیگه',
  //     price: "1500",
  //     rate: "4.5",
  //     foodPic: 'assets/images/food_images/burger2.jpg',
  //   ),
  //   FoodCard(
  //     foodName: 'همچنان برگر',
  //     price: "1500",
  //     rate: "4.5",
  //     foodPic: 'assets/images/food_images/burger3.jpg',
  //   ),
  //   FoodCard(
  //     foodName: 'قیمه',
  //     price: "1500",
  //     rate: "4.5",
  //     foodPic: 'assets/images/food_images/gheime.jpg',
  //   ),
  //   FoodCard(
  //     foodName: 'قرمه',
  //     price: "1500",
  //     rate: "4.5",
  //     foodPic: 'assets/images/food_images/ghorme.jpg',
  //   ),
  //   FoodCard(
  //     foodName: 'جوجه',
  //     price: "1500",
  //     rate: "4.5",
  //     foodPic: 'assets/images/food_images/jooj.jpg',
  //   ),
  //   FoodCard(
  //     foodName: 'سوخاری',
  //     price: "1500",
  //     rate: "4.5",
  //     foodPic: 'assets/images/food_images/sokhari.jpg',
  //   ),
  // ];

  List<Widget> categoryList = [
    CategoryItems(categoryText: 'کباب', id: CategoryItemsEnum.kebab),
    CategoryItems(
      categoryText: 'سیب زمینی',
      id: CategoryItemsEnum.friedPotato,
    ),
    CategoryItems(
      categoryText: 'سوخاری',
      id: CategoryItemsEnum.friedChicken,
    ),
    CategoryItems(
      categoryText: 'پیتزا',
      id: CategoryItemsEnum.pizza,
    ),
    CategoryItems(
      categoryText: 'ساندویچ',
      id: CategoryItemsEnum.burger,
    ),
    CategoryItems(
      categoryText: 'نوشیدنی',
      id: CategoryItemsEnum.beverage,
    ),
    CategoryItems(categoryText: 'سالاد', id: CategoryItemsEnum.salad),
    CategoryItems(categoryText: 'پیش غذا', id: CategoryItemsEnum.preFood),
    //CategoryItems(categoryText: 'سنتی', id: CategoryItemsEnum.traditional),
    //CategoryItems(categoryText: 'سرد', id: CategoryItemsEnum.snack),
  ];

  List<Widget> cartItems = [
    CartOrders(id: 1),
    CartOrders(id: 2),
    CartOrders(id: 3),
    CartOrders(id: 4),
    CartOrders(id: 5),
  ];
}
