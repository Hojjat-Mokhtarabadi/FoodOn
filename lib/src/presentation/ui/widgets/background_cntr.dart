import 'package:flutter/material.dart';
import 'package:foodon/constants.dart';

class BackgroundContainer extends StatelessWidget {
  final child;
  BackgroundContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBackgroundImageBox,
      child: this.child,
    );
  }
}
