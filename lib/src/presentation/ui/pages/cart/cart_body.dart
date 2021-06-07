import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/data/models/cart/cart_order.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';
import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/domain/usecases/clear_cart.dart';
import 'package:foodon/src/domain/usecases/get_comments_scores_list.dart';
import 'package:foodon/src/domain/usecases/get_food_details.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/check_out_bloc/checkout_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/food_details_bloc/food_details_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/get_comments_bloc/get_comments_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/details_page.dart';
import 'package:foodon/src/presentation/ui/widgets/my_text_button.dart';
import 'package:foodon/src/presentation/utils/providers/cart_info.dart';
import 'package:foodon/src/presentation/utils/providers/user_info.dart';
import 'package:provider/provider.dart';

import 'blocs/delete_cart_order/delete_cart_order_bloc.dart';
import 'cart_orders.dart';

class CartBody extends StatefulWidget {
  final List<CartOrdersView> orders;
  final List<FirebaseFileModel> images;
  CartBody({this.orders, this.images});

  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  double _totalPrice = 0;
  int _foodId;
  int _foodCount;

  @override
  Widget build(BuildContext context) {
    final cartInfoProv = Provider.of<CartInfoProvider>(context);
    final userInfoProv = Provider.of<UserInfoProvider>(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 1.0),
                Text('محصول'),
                SizedBox(width: 1.0),
                Text('تعداد'),
                SizedBox(width: 5.0),
                Text('فی'),
                SizedBox(width: 10.0),
                Text('مجموع'),
                SizedBox(width: 1.0)
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
              endIndent: 35.0,
              indent: 35.0,
            ),
            ListView.builder(
                shrinkWrap: true,
                //padding: EdgeInsets.symmetric(vertical: 4.0),
                itemCount: widget.orders.length,
                itemBuilder: (BuildContext context, int index) {
                  _totalPrice = _totalPrice + widget.orders[index].price;
                  _foodId = widget.orders[index].foodId;
                  _foodCount = widget.orders[index].count;
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 7.0, horizontal: 30.0),
                      child: Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.15,
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            color: Colors.transparent,
                            // icon: Icons.delete,
                            iconWidget: CircleAvatar(
                              child: Icon(
                                FontAwesomeIcons.solidTrashAlt,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              backgroundColor: Colors.red,
                              //backgroundColor: Colors.transparent,
                            ),
                            onTap: () {
                              BlocProvider.of<DeleteCartOrderBloc>(context).add(
                                DeleteSelectedOrderEvent(
                                  order: CartOrder((c) => c
                                    ..cartId = cartInfoProv.cartId
                                    ..foodId = _foodId),
                                ),
                              );
                            },
                          ),
                          IconSlideAction(
                            color: Colors.blue,
                            icon: Icons.add,
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => DetailsPage(
                                    foodId: _foodId,
                                    initialCount: _foodCount,
                                    firebaseFileModel: widget.images[index],
                                  ),
                                ),
                              );
                              BlocProvider.of<CommentsBloc>(context).add(
                                GetAllCommentsEvent(
                                  commentsReq: CommentsReqModel(
                                    foodId: _foodId,
                                    userId: userInfoProv.id,
                                  ),
                                ),
                              );
                              BlocProvider.of<FoodDetailsBloc>(context).add(
                                GetFoodDetailsEvent(
                                  fdReq: FoodDetailsReqModel(
                                    foodId: _foodId,
                                    userId: userInfoProv.id,
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                        child: CartOrders(
                          cartOrder: widget.orders[index],
                          setBorder: true,
                          onTap: () {},
                        ),
                      ));
                }),
            Divider(
              thickness: 0.5,
              color: Colors.black,
              endIndent: 35.0,
              indent: 35.0,
            ),
          ],
        ),
        Positioned(
          bottom: 30.0,
          child: MyTextButton(
            text: 'پــــرداخــت',
            onTap: () {
              // BlocProvider.of<ClearCartBloc>(context).add(ClearUserCartEvent(
              //     cartInfo: ClearCartInfo(cartId: cartInfoProv.cartId)));
              // BlocProvider.of<AddBillBloc>(context).add(
              //   PostNewBillEvent(
              //     bill: Bill(
              //       (c) => c
              //         ..customerId = userInfoProv.id
              //         ..deliveryId = 1
              //         ..date = DateTime.now().toUtc()
              //         ..totalPrice = 100,
              //     ),
              //   ),
              // );
              BlocProvider.of<CheckoutBloc>(context).add(
                CheckoutOrdersEvent(
                  cartOrdersList: widget.orders,
                  cartInfo: ClearCartReqModel(cartId: cartInfoProv.cartId),
                  bill: Bill(
                    (c) => c
                      ..customerId = userInfoProv.id
                      ..deliveryId = 1
                      ..date = DateTime.now().toUtc()
                      ..totalPrice = _totalPrice,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
