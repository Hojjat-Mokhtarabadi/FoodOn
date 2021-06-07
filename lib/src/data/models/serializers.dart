library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/data/models/bill/bills_list.dart';
import 'package:foodon/src/data/models/bill/ins_orders_list.dart';
import 'package:foodon/src/data/models/bill/orders_list.dart';
import 'package:foodon/src/data/models/cart/cart_orders_list.dart';
import 'package:foodon/src/data/models/category/category.dart';
import 'package:foodon/src/data/models/customer/authentication_response.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/data/models/delivery/delivery.dart';
import 'package:foodon/src/data/models/food/comment.dart';
import 'package:foodon/src/data/models/food/comment_view.dart';
import 'package:foodon/src/data/models/food/comment_view_list.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/data/models/food/food_view.dart';
import 'package:foodon/src/data/models/food/foods_list.dart';
import 'package:foodon/src/data/models/food/score.dart';

import 'bill/order.dart';
import 'cart/cart_order.dart';
import 'cart/cart_orders_view.dart';
import 'category/categories_list.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Food,
  FoodsList,
  FoodView,
  Category,
  CategoriesList,
  Bill,
  BillsList,
  BillOrder,
  BillOrdersList,
  OrdersList,
  CartOrder,
  CartOrdersList,
  Customer,
  Delivery,
  Comment,
  CommentViewList,
  Score,
  AuthenticationResponse,
  CartOrdersView,
  CommentView,
  CommentViewList,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
