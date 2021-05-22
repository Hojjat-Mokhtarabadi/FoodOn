library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:foodon/src/data/models/cart/bill.dart';
import 'package:foodon/src/data/models/cart/orders_list.dart';
import 'package:foodon/src/data/models/category/category.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/data/models/delivery/delivery.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/data/models/food/foods_list.dart';

import 'cart/order.dart';
import 'category/categories_list.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Food,
  FoodsList,
  Category,
  CategoriesList,
  Order,
  OrdersList,
  Customer,
  Delivery,
  Bill
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
