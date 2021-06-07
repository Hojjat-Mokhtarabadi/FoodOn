import 'package:flutter/material.dart';
import 'package:foodon/size_config.dart';

import '../../../../constants.dart';

class TopHeader extends StatelessWidget {
  final String headerName;
  const TopHeader({Key key, @required this.headerName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    return Container(
      width: SizeConfig.w / 3,
      height: SizeConfig.h * 0.08,
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          )),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            headerName,
            style: kHeadingTextStyle,
          ),
        ),
      ),
    );
  }
}
