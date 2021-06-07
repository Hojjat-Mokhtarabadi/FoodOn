import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/src/presentation/ui/pages/bill/bloc/bill_bloc.dart';
import 'package:foodon/src/presentation/ui/widgets/background_cntr.dart';
import 'package:foodon/src/presentation/ui/widgets/top_header.dart';
import 'package:shamsi_date/extensions.dart';

import 'bill_orders_info_card.dart';

Color kOrderItemsColor = Colors.grey.withOpacity(0.15);

class OrdersInfoPage extends StatelessWidget {
  OrdersInfoPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                TopHeader(headerName: 'اطلاعات سفارش'),
                SizedBox(height: 25.0),
                Expanded(
                  child: BlocConsumer(
                    bloc: BlocProvider.of<BillDetailsBloc>(context),
                    builder: (context, state) {
                      print(state);
                      if (state is BillDetailsLoaded) {
                        print(state.billDetails.orderDate);
                        print(state.billDetails.ordersList);
                        Jalali j =
                            Jalali.fromDateTime(state.billDetails.orderDate);
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: kOrderItemsColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 35.0, vertical: 10.0),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 20.0),
                              child: Row(
                                children: [
                                  Text('شماره سفارش: '),
                                  Text('${state.billDetails.orderId}'),
                                  Spacer(),
                                  Text('تاریخ: '),
                                  Text('${j.year}/${j.month}/${j.day}'),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35.0),
                              child: Row(
                                children: [
                                  _buildFraction(txt: 'محصول'),
                                  _buildFraction(txt: 'تعداد'),
                                  _buildFraction(txt: 'مجموع'),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              indent: 35.0,
                              endIndent: 35.0,
                            ),
                            Expanded(
                              child: ListView(
                                children: [
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        state.billDetails.ordersList.length,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30.0, vertical: 0),
                                    itemBuilder: (context, index) =>
                                        BillOrdersInfoCard(
                                      ordersView:
                                          state.billDetails.ordersList[index],
                                    ),
                                  ),
                                  Container(
                                    decoration:
                                        BoxDecoration(color: kOrderItemsColor),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 30.0),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30.0, vertical: 10.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '${state.billDetails.totalPrice}',
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                            ' تومان',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      } else if (state is BillDetailsLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Container();
                    },
                    listener: (context, state) {
                      print(state);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
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
