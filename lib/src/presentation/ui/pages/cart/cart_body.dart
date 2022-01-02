import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';
import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/domain/usecases/clear_cart.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/check_out_bloc/checkout_bloc.dart';
import 'package:foodon/src/presentation/ui/widgets/my_text_button.dart';
import 'package:foodon/src/presentation/utils/providers/cart_info.dart';
import 'package:foodon/src/presentation/utils/providers/user_info.dart';
import 'package:provider/provider.dart';

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
              thickness: 0.4,
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
                  print('in cart');
                  // print(widget.orders);
                  print(_foodId);
                  print(_foodCount);
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 7.0, horizontal: 30.0),
                    child: CartOrders(
                      cartOrder: widget.orders[index],
                      foodId: widget.orders[index].foodId,
                      foodCount: widget.orders[index].count,
                      image: widget.images[index],
                      setBorder: true,
                      onTap: () {},
                    ),
                  );
                }),
            Divider(
              thickness: 0.4,
              color: Colors.black,
              endIndent: 35.0,
              indent: 35.0,
            ),
          ],
        ),
        Positioned(
          bottom: 30.0,
          child: MyTextButton(
            text: '  پـــــرداخـــت  ',
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
