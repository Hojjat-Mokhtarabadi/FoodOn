import 'package:flutter/material.dart';

import '../../../../constants.dart';

class MyTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  MyTextButton({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 54.0, vertical: 11.0),
        backgroundColor: kDarkerPrimaryColor,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      child: Text(
        text,
        style: kHeadingTextStyle.copyWith(color: Colors.white),
      ),
    );
  }
}
