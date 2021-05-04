import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          //automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.height * 0.06, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                    'assets/images/icons/notifications_active.svg'),
                SvgPicture.asset('assets/images/icons/logo up.svg',
                    fit: BoxFit.fill),
                SvgPicture.asset('assets/images/icons/hamber_drawer.svg'),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(child: HomeBody()),
    );
  }
}
