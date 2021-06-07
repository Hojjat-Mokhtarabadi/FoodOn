import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';

class CartOrders extends StatefulWidget {
  final CartOrdersView cartOrder;
  final VoidCallback onTap;
  final bool setBorder;
  final bool setTopRadius;
  final bool setDownRadius;

  const CartOrders(
      {@required this.cartOrder,
      @required this.onTap,
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PhysicalModel(
        color: Colors.white,
        shadowColor: kShadowColor,
        elevation: 8.0,
        borderRadius: radius,
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: radius),
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
                    child: FittedBox(child: Text('${widget.cartOrder.count}')),
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
                      '${widget.cartOrder.price / widget.cartOrder.count}00',
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
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 15.0),
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
    );
  }
}
