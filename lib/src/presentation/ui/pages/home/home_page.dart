import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/src/presentation/utils/enums.dart';

import '../../../../../size_config.dart';
import 'home_body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            //automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.height * 0.01, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(kImageAddress[ImageAddresses.drawer]),
                  SvgPicture.asset(kImageAddress[ImageAddresses.logo],
                      fit: BoxFit.fill),
                  SvgPicture.asset(kImageAddress[ImageAddresses.notification]),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(child: HomeBody()),
    );
  }
}
