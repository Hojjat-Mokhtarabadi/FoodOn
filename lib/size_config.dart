import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double h = 0;
  static double w = 0;
  SizeConfig({@required BuildContext context}) {
    var size = MediaQuery.of(context).size;
    h = size.height;
    w = size.width;
  }
}
