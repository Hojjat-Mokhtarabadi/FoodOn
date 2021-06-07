import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/presentation/ui/pages/bill/bloc/bill_bloc.dart';
import 'package:shamsi_date/shamsi_date.dart';

import 'bill_info.dart';

class BillCard extends StatefulWidget {
  final Bill bill;
  BillCard({this.bill});

  @override
  _BillCardState createState() => _BillCardState();
}

class _BillCardState extends State<BillCard> {
  Jalali j;
  @override
  void initState() {
    super.initState();
    j = Jalali.fromDateTime(widget.bill.date);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => OrdersInfoPage()));
        BlocProvider.of<BillDetailsBloc>(context)
            .add(GetBillDetailsEvent(billId: widget.bill.id));
      },
      child: PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        elevation: 7.0,
        shadowColor: kShadowColor,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
          // margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
          child: Row(
            children: [
              _buildFraction(txt: '${widget.bill.id}'),
              _buildFraction(txt: '${j.year}/${j.month}/${j.day}'),
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${widget.bill.totalPrice}',
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
