import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/src/data/models/cart/cart_order.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';
import 'package:foodon/src/domain/usecases/get_comments_scores_list.dart';
import 'package:foodon/src/domain/usecases/get_food_details.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/food_details_bloc/food_details_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/get_comments_bloc/get_comments_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/details_page.dart';
import 'package:foodon/src/presentation/utils/providers/cart_info.dart';
import 'package:foodon/src/presentation/utils/providers/user_info.dart';
import 'package:provider/provider.dart';

import 'blocs/delete_cart_order/delete_cart_order_bloc.dart';

class CartOrders extends StatefulWidget {
  final CartOrdersView cartOrder;
  final int foodId;
  final int foodCount;
  final image;
  final VoidCallback onTap;
  final bool setBorder;
  final bool setTopRadius;
  final bool setDownRadius;

  const CartOrders(
      {@required this.cartOrder,
      @required this.onTap,
      @required this.foodId,
      this.foodCount,
      this.image,
      this.setBorder,
      this.setTopRadius,
      this.setDownRadius});

  @override
  _CartOrdersState createState() => _CartOrdersState();
}

class _CartOrdersState extends State<CartOrders> {
  int orderNum = 1;
  BorderRadius radius;

  @override
  void initState() {
    super.initState();
    if (!widget.setBorder && !widget.setTopRadius && !widget.setDownRadius)
      radius = BorderRadius.circular(0.0);
    else if (!widget.setBorder && widget.setTopRadius)
      radius = BorderRadius.only(
          topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0));
    else if (!widget.setBorder && widget.setDownRadius)
      radius = BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0));
    else
      radius = BorderRadius.circular(8.0);
  }

  @override
  Widget build(BuildContext context) {
    final cartInfoProv = Provider.of<CartInfoProvider>(context);
    final userInfoProv = Provider.of<UserInfoProvider>(context);
    return Slidable(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: PhysicalModel(
            color: Colors.white,
            shadowColor: kShadowColor,
            elevation: 8.0,
            borderRadius: radius,
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: radius),
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 14.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Text(
                          widget.cartOrder.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 0.4,
                    ),
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.2,
                        alignment: Alignment.centerRight,
                        child:
                            FittedBox(child: Text('${widget.cartOrder.count}')),
                        // OrdersCountRow(
                        //   //foodId: widget.id,
                        //   initialCount: widget.cartOrder.count,
                        //   orderNumFunction: (num) {
                        //     orderNum = num;
                        //     print(num);
                        //   },
                        // ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 0.4,
                    ),
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${(widget.cartOrder.price / widget.cartOrder.count).round()}00',
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 0.4,
                    ),
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.85,
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                '${widget.cartOrder.price}',
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 15.0),
                              ),
                              Text(
                                ' تومان',
                                style: TextStyle(fontSize: 8.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.15,
        secondaryActions: <Widget>[
          IconSlideAction(
            color: Colors.transparent,
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
                    ..foodId = widget.foodId),
                ),
              );
            },
          ),
          IconSlideAction(
            color: Colors.transparent,
            iconWidget: CircleAvatar(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 25.0,
              ),
              backgroundColor: kPrimaryColor,
//backgroundColor: Colors.transparent,
            ),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => DetailsPage(
                    foodId: widget.foodId,
                    initialCount: widget.foodCount,
                    firebaseFileModel: widget.image,
                  ),
                ),
              );
              BlocProvider.of<CommentsBloc>(context).add(
                GetAllCommentsEvent(
                  commentsReq: CommentsReqModel(
                    foodId: widget.foodId,
                    userId: userInfoProv.id,
                  ),
                ),
              );
              BlocProvider.of<FoodDetailsBloc>(context).add(
                GetFoodDetailsEvent(
                  fdReq: FoodDetailsReqModel(
                    foodId: widget.foodId,
                    userId: userInfoProv.id,
                  ),
                ),
              );
            },
          )
        ]);
  }
}
