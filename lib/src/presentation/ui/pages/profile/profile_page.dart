import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/presentation/ui/pages/login/login_page.dart';
import 'package:foodon/src/presentation/ui/pages/my_orders/bloc/bills_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/my_orders/my_bills_list.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/log_out_bloc/logout_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/profile/update_info_page.dart';
import 'package:foodon/src/presentation/ui/widgets/errors_alert.dart';
import 'package:foodon/src/presentation/ui/widgets/loading_progress.dart';
import 'package:foodon/src/presentation/utils/enums.dart';
import 'package:foodon/src/presentation/utils/providers/bottom_nav_state.dart';
import 'package:foodon/src/presentation/utils/providers/user_info.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';

final _dialogKey = GlobalKey<State>();

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    final userInfoProv = Provider.of<UserInfoProvider>(context);
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
                    "${userInfoProv.firstName} ${userInfoProv.lastName}",
                    style: kHeadingTextStyle,
                  ),
                  SizedBox(height: 3.0),
                  Text(userInfoProv.phone),
                  Divider(
                    color: Colors.black,
                    indent: SizeConfig.w * 0.18,
                    endIndent: SizeConfig.w * 0.18,
                  ),
                  SizedBox(height: 5.0),
                  _buildContainer(
                      txt: '?????????????????????????? ??????????',
                      icon: kProfileAddresses[ProfileIcons.myOrders],
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => MyOrdersPage()));
                        BlocProvider.of<BillsListBloc>(context)
                            .add(GetBillsListEvent(userId: userInfoProv.id));
                      }),
                  _buildContainer(
                      txt: '???????????????????? ??????????????????????????????????',
                      icon: kProfileAddresses[ProfileIcons.wallet],
                      onPressed: () {}),
                  _buildContainer(
                      txt: '???????????????????? ????????????',
                      icon: kProfileAddresses[ProfileIcons.activeOrders],
                      onPressed: () {}),
                  _buildContainer(
                      txt: '???????????????? ??????????????????',
                      icon: kProfileAddresses[ProfileIcons.editProfile],
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => UpdateUserInformationPage(
                              id: userInfoProv.id,
                              firstName: userInfoProv.firstName,
                              lastName: userInfoProv.lastName,
                              address: userInfoProv.address,
                              phone: userInfoProv.phone,
                              pass: userInfoProv.password,
                            ),
                          ),
                        );
                        // BlocProvider.of<UserInfoBloc>(context)
                        //     .add(GetUserInfoEvent(userId: prov.id));
                      }),
                  _buildContainer(
                      txt: '?????????????????? ????????????????',
                      icon: kProfileAddresses[ProfileIcons.faq],
                      onPressed: () {}),
                  _buildContainer(
                      txt: '??????????????????????????????????????????????????????????????????????????',
                      flag: true,
                      icon: kProfileAddresses[ProfileIcons.exit],
                      color: Colors.red,
                      onPressed: () {
                        BlocProvider.of<LogoutBloc>(context)
                            .add(LogOutUserEvent(userId: userInfoProv.id));
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
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.w * 0.16, vertical: 0),
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
