import 'package:flutter/material.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/src/presentation/ui/widgets/order_count_row.dart';

class CartOrders extends StatefulWidget {
  final int id;
  const CartOrders({@required this.id});

  @override
  _CartOrdersState createState() => _CartOrdersState();
}

class _CartOrdersState extends State<CartOrders> {
  int orderNum = 1;
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      shadowColor: kShadowColor,
      elevation: 10.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 12.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.65,
                  child: FittedBox(
                    child: Text(
                      'برگر مخصوص',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              VerticalDivider(
                color: Colors.black,
                thickness: 0.4,
              ),
              OrdersCountRow(
                foodId: widget.id,
                orderNumFunction: (num) {
                  orderNum = num;
                  print(num);
                },
              ),
              // Row(
              //   children: [
              //     IconButton(
              //       icon: Icon(Icons.add),
              //       constraints: BoxConstraints(),
              //       padding: EdgeInsets.symmetric(horizontal: 3.0),
              //       splashRadius: 17.0,
              //       onPressed: () {
              //         setState(() {
              //           _orderNum++;
              //         });
              //       },
              //     ),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 7.0),
              //       child: Text(
              //         '$_orderNum',
              //         style: kHeadingTextStyle.copyWith(fontSize: 17.0),
              //       ),
              //     ),
              //     IconButton(
              //       icon: Icon(
              //         FontAwesomeIcons.minus,
              //         size: 18.0,
              //       ),
              //       constraints: BoxConstraints(),
              //       padding: EdgeInsets.symmetric(horizontal: 3.0),
              //       splashRadius: 17.0,
              //       onPressed: () {
              //         setState(() {
              //           if (_orderNum > 1) _orderNum--;
              //         });
              //       },
              //     ),
              //   ],
              // ),
              VerticalDivider(
                color: Colors.black,
                thickness: 0.4,
              ),
              Text(
                '15000',
                style: TextStyle(color: Colors.grey),
              ),
              VerticalDivider(
                color: Colors.black,
                thickness: 0.4,
              ),
              Row(
                children: [
                  Text(
                    '63000',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  Text('تومان')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
