import 'package:flutter/material.dart';
import 'package:foodon/src/presentation/utils/enums.dart';

import '../../../../constants.dart';

class OrdersCountRow extends StatefulWidget {
  final int foodId;
  final int initialCount;
  final void Function(int num) orderNumFunction;
  const OrdersCountRow(
      {this.foodId, this.orderNumFunction, this.initialCount = 1});

  @override
  _OrdersCountRowState createState() => _OrdersCountRowState();
}

class _OrdersCountRowState extends State<OrdersCountRow> {
  int orderNum;
  @override
  void initState() {
    super.initState();
    orderNum = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          //icon: Icon(Icons.add),
          icon: Image.asset(
            kImagesAddress[ImageAddresses.add],
            width: 30.0,
          ),
          constraints: BoxConstraints(),
          iconSize: 28,
          padding: EdgeInsets.symmetric(horizontal: 3.0),
          splashRadius: 17.0,
          onPressed: () {
            setState(() {
              orderNum++;
              widget.orderNumFunction(orderNum);
            });
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.0),
          child: Text(
            '$orderNum',
            style: kHeadingTextStyle.copyWith(fontSize: 20.0),
          ),
        ),
        IconButton(
          icon: Image.asset(
            kImagesAddress[ImageAddresses.minus],
            // width: 40.0,
            // height: 40.0,
          ),
          constraints: BoxConstraints(),
          iconSize: 28,
          padding: EdgeInsets.symmetric(horizontal: 3.0),
          splashRadius: 17.0,
          onPressed: () {
            setState(() {
              if (orderNum > 1) {
                setState(() {
                  orderNum--;
                  widget.orderNumFunction(orderNum);
                });
              }
            });
          },
        ),
      ],
    );
  }
}
