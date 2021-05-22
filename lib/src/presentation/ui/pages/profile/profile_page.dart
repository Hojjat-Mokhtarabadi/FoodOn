import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/presentation/ui/pages/login/login_page.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/log_out_bloc/logout_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/profile/update_info_page.dart';
import 'package:foodon/src/presentation/ui/widgets/errors_alert.dart';
import 'package:foodon/src/presentation/ui/widgets/loading_stack.dart';
import 'package:foodon/src/presentation/utils/enums.dart';
import 'package:foodon/src/presentation/utils/providers/bottom_nav_state.dart';
import 'package:foodon/src/presentation/utils/providers/user_id.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';
import 'blocs/user_info_bloc/user_info_bloc.dart';

final _dialogKey = GlobalKey<State>();

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    final prov = Provider.of<UserInfoProvider>(context);
    final bottomNavState =
        Provider.of<BottomNavStateProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: kBackgroundImageBox,
        child: SafeArea(
          child: BlocConsumer(
            bloc: BlocProvider.of<LogoutBloc>(context),
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 28.0,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "${prov.firstName} ${prov.lastName}",
                    style: kHeadingTextStyle,
                  ),
                  SizedBox(height: 3.0),
                  Text(prov.phone),
                  Divider(
                    color: Colors.black,
                    indent: SizeConfig.width * 0.18,
                    endIndent: SizeConfig.width * 0.18,
                  ),
                  SizedBox(height: 5.0),
                  _buildContainer(
                      txt: 'ســفــارشــات مـــن',
                      icon: kProfileAddresses[ProfileIcons.myOrders],
                      onPressed: () {}),
                  _buildContainer(
                      txt: 'کـــیــــف پــــــــــــــول',
                      icon: kProfileAddresses[ProfileIcons.wallet],
                      onPressed: () {}),
                  _buildContainer(
                      txt: 'سـفـارشـات فـعـال',
                      icon: kProfileAddresses[ProfileIcons.activeOrders],
                      onPressed: () {}),
                  _buildContainer(
                      txt: 'ویـرایـش پـروفـایل',
                      icon: kProfileAddresses[ProfileIcons.editProfile],
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => UpdateUserInformationPage(
                              id: prov.id,
                              firstName: prov.firstName,
                              lastName: prov.lastName,
                              address: prov.lastName,
                              phone: prov.phone,
                              pass: prov.password,
                            ),
                          ),
                        );
                        BlocProvider.of<UserInfoBloc>(context)
                            .add(GetUserInfoEvent(userId: prov.id));
                      }),
                  _buildContainer(
                      txt: 'ســوالـات مـتـداول',
                      icon: kProfileAddresses[ProfileIcons.faq],
                      onPressed: () {}),
                  _buildContainer(
                      txt: 'خـــــــــــــــــــــــــــــــــروج',
                      flag: true,
                      icon: kProfileAddresses[ProfileIcons.exit],
                      color: Colors.red,
                      onPressed: () {
                        BlocProvider.of<LogoutBloc>(context)
                            .add(LogOutUserEvent(userId: prov.id));
                      }),
                ],
              );
            },
            listener: (context, state) {
              if (state is LogoutLoading) {
                showLoadingProgress(context: context, key: _dialogKey);
              } else if (state is LogoutSuccess) {
                Navigator.pop(_dialogKey.currentContext);
                bottomNavState.setHideState(shouldHide: true);
                navigatorKey.currentState.pushAndRemoveUntil(
                    CupertinoPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              } else if (state is LogoutError) {
                showAlertDialog(
                  context: context,
                  msg: state.message,
                  bloc: (c) {
                    Navigator.of(c).pop();
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(
      {String txt,
      Color color = Colors.black,
      bool flag = false,
      String icon,
      VoidCallback onPressed}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.16, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              // margin: EdgeInsets.symmetric(
              //     horizontal: SizeConfig.width * 0.18, vertical: 0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      icon,
                      fit: BoxFit.fill,
                      width: 32.0,
                      height: 32.0,
                    ),
                    Spacer(),
                    // SizedBox(width: 15.0),
                    Text(
                      txt,
                      style: TextStyle(color: color, fontSize: 17.0),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          if (!flag)
            Divider(
              color: Colors.black,
              thickness: 0.4,
            )
        ],
      ),
    );
  }
}
