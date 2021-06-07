import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';
import 'package:foodon/src/data/models/food/comment_view.dart';
import 'package:foodon/src/data/models/food/food.dart';

class CommentsListModel extends Equatable {
  final List<CommentView> commentsList;
  final bool alreadyCommented;
  final int commentId;
  CommentsListModel({this.commentsList, this.alreadyCommented, this.commentId});

  @override
  List<Object> get props => [commentsList, alreadyCommented, commentId];
}

class BillDetailsModel extends Equatable {
  final List<CartOrdersView> ordersList;
  final int orderId;
  final DateTime orderDate;
  final double totalPrice;

  BillDetailsModel(
      {this.ordersList, this.orderId, this.orderDate, this.totalPrice});

  @override
  List<Object> get props => [ordersList, orderId, orderDate, totalPrice];
}

class FoodDetailsModel extends Equatable {
  final Food foodDetails;
  final bool existInCart;
  final int existFoodId;
  FoodDetailsModel({this.foodDetails, this.existInCart, this.existFoodId});

  @override
  List<Object> get props => [foodDetails, existInCart, existFoodId];
}

class FirebaseFileModel extends Equatable {
  final Reference ref;
  final String name;
  final String url;

  FirebaseFileModel({this.ref, this.name, this.url});

  @override
  List<Object> get props => [ref, name, url];
}
