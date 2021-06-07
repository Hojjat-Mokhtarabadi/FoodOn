import 'package:flutter/material.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';
import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/presentation/ui/pages/cart/cart_orders.dart';

import '../../../../../constants.dart';

class BillBody extends StatelessWidget {
  final BillDetailsModel bill;
  BillBody({
    this.bill,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    return Column(
      children: [
        Row(
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
        Expanded(
          child: ListView(
            //shrinkWrap: true,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                itemCount: bill.ordersList.length,
                itemBuilder: (context, index) => CartOrders(
                    cartOrder: CartOrdersView(
                      (c) => c
                        ..price = bill.ordersList[index].price
                        ..name = bill.ordersList[index].name
                        ..count = bill.ordersList[index].count
                        ..foodId = bill.ordersList[index].foodId,
                    ),
                    setBorder: bill.ordersList.length == 1 ? true : false,
                    setTopRadius: index == 0 ? true : false,
                    setDownRadius:
                        index == bill.ordersList.length - 1 ? true : false,
                    onTap: () {}),
              ),
              SizedBox(height: 35.0),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w * 0.2, vertical: 20.0),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 5.0,
                  shadowColor: kShadowColor,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    //width: SizeConfig.w * 0.6,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildRow(
                                firstTxt: '${bill.totalPrice}',
                                secondTxt: 'جمع کل :'),
                            _buildRow(
                                firstTxt: '0',
                                secondTxt: 'مالیات و ارزش افزوده :'),
                            _buildRow(
                                firstTxt: '0',
                                secondTxt: 'تخفیفات :',
                                color: Colors.red),
                            _buildRow(
                                firstTxt: '${bill.totalPrice}',
                                secondTxt: 'مبلغ نهایی :'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //Spacer(),

        SizedBox(height: 30.0),
      ],
    );
  }

  Widget _buildRow({
    String firstTxt,
    String secondTxt,
    Color color = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(secondTxt, style: TextStyle(color: color)),
          Spacer(),
          Text('$firstTxt تومان', style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
