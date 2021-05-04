import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double height = 0;
  static double width = 0;
  SizeConfig({@required BuildContext context}) {
    var size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
  }
}
