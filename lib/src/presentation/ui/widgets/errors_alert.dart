import 'package:flutter/material.dart';

void showAlertDialog<T>(
    {BuildContext context, String msg, Function(BuildContext context) bloc}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(msg),
        actions: <Widget>[
          TextButton(
              child: Text('تلاش دوباره'),
              onPressed: () {
                bloc(context);
              }),
        ],
      );
    },
  );
}
