import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

void showFlushBar({BuildContext context}) {
  Flushbar(
    margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 45.0),
    flushbarPosition: FlushbarPosition.TOP,
    padding: EdgeInsets.all(10),
    boxShadows: [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(3, 3),
        blurRadius: 3,
      ),
    ],
    borderRadius: BorderRadius.circular(8),
    duration: Duration(milliseconds: 1000),
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    backgroundColor: Colors.white,
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'اطلاعات با موفقیت ثبت شد',
          style: TextStyle(color: kPrimaryColor, fontSize: 17.0),
        ),
        Icon(
          Icons.check_circle,
          color: kPrimaryColor,
          size: 25.0,
        ),
      ],
    ),
  )..show(context);
}
