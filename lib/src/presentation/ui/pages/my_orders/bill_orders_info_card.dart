import 'package:flutter/material.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';

import '../../../../../constants.dart';
import 'bill_info.dart';

class BillOrdersInfoCard extends StatelessWidget {
  final CartOrdersView ordersView;
  BillOrdersInfoCard({this.ordersView});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kOrderItemsColor,
      ),
      padding: EdgeInsets.only(left: 10, right: 10, top: 9.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _buildFraction(txt: '${this.ordersView.name}'),
              _buildFraction(txt: '${this.ordersView.count}'),
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${this.ordersView.price}',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        Text(
                          'تومان',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // _buildFraction(),
            ],
          ),
          SizedBox(height: 4.0),
          Divider(
            color: Colors.white,
            thickness: 2.0,
            indent: 10.0,
            endIndent: 10.0,
          )
        ],
      ),
    );
  }

  Widget _buildFraction({String txt}) {
    return Flexible(
        child: FractionallySizedBox(
      widthFactor: 1,
      child: Text(
        txt,
        textAlign: TextAlign.center,
      ),
    ));
  }
}
