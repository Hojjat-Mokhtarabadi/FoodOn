import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/core/validator/validator.dart';
import 'package:foodon/locator.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/domain/usecases/get_user_authentication.dart';
import 'package:foodon/src/presentation/ui/pages/login/blocs/login_bloc/login_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/main_menu/main_menu.dart';
import 'package:foodon/src/presentation/ui/pages/sign_up/sign_up.dart';
import 'package:foodon/src/presentation/ui/widgets/loading_stack.dart';
import 'package:foodon/src/presentation/ui/widgets/text_field.dart';
import 'package:foodon/src/presentation/utils/enums.dart';
import 'package:foodon/src/presentation/utils/providers/bottom_nav_state.dart';
import 'package:foodon/src/presentation/utils/providers/user_id.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _dialogKey = GlobalKey<State>();
  final validator = locator<Validator>();
  TextEditingController _userController;
  TextEditingController _passController;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    final userProvider = Provider.of<UserInfoProvider>(context, listen: false);
    final bottomNavState =
        Provider.of<BottomNavStateProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(kImagesAddress[ImageAddresses.background2]),
              fit: BoxFit.cover),
          //    borderRadius: BorderRadius.circular(15.0)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Container(
                //height: SizeConfig.height * 0.94,
                decoration: BoxDecoration(
                  //color: Colors.blue,
                  color: kPrimaryColor.withOpacity(0.2),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black,
                  //     offset: Offset(1.0, 1.0),
                  //     blurRadius: 15.0,
                  //   ),
                  // ],
                  borderRadius: BorderRadius.circular(18.0),
                ),
                margin: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 25.0,
                    bottom: SizeConfig.height * 0.1),
                //padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    SizedBox(height: 30.0),
                    Image.asset('assets/images/icons_png/logo2.png'),
                    //Spacer(),
                    SizedBox(height: SizeConfig.height * 0.05),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'ورود',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black54,
                                    offset: Offset(3.0, 3.0),
                                  ),
                                ],
                              ),
                            ),
                            //Spacer(),
                            SizedBox(height: 35.0),
                            MyTextField(
                                txt: 'نام کـاربـری',
                                iconData: FontAwesomeIcons.userAlt,
                                type: TextInputType.number,
                                validator: validator.validateEmptyFields,
                                controller: _userController),
                            MyTextField(
                                txt: 'رمـــز عــبـــور',
                                iconData: FontAwesomeIcons.key,
                                validator: validator.validateEmptyFields,
                                controller: _passController),
                            SizedBox(height: SizeConfig.height * 0.12),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    GetUserAuthenticationEvent(
                                      user: User(
                                        userName: _userController.text,
                                        password: _passController.text,
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: kPrimaryColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 60.0, vertical: 12.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                              ),
                              child: BlocConsumer(
                                bloc: BlocProvider.of<LoginBloc>(context),
                                builder: (context, state) {
                                  // if (state is LoginLoading) {
                                  //   return SizedBox(
                                  //     height: 20.0,
                                  //     width: 120.0,
                                  //     child: FittedBox(
                                  //       fit: BoxFit.fitHeight,
                                  //       child: CircularProgressIndicator(
                                  //         backgroundColor: Colors.white,
                                  //         strokeWidth: 3.0,
                                  //       ),
                                  //     ),
                                  //   );
                                  // }
                                  return Container(
                                    width: 120,
                                    child: Text(
                                      'ورود به حساب کاربری',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                },
                                listener: (context, state) {
                                  if (state is LoginLoading) {
                                    showLoadingProgress(
                                      context: context,
                                      key: _dialogKey,
                                    );
                                  } else if (state is LoginSuccess) {
                                    Navigator.pop(_dialogKey.currentContext);
                                    bottomNavState.setHideState(
                                        shouldHide: false);
                                    userProvider.setInfo(
                                        userId: state.customer.id,
                                        firstName: state.customer.fName,
                                        lastName: state.customer.lName,
                                        phone: state.customer.phone,
                                        address: state.customer.address,
                                        pass: state.customer.password);
                                    Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (BuildContext context) =>
                                            MainMenu(),
                                      ),
                                    );
                                  } else if (state is LoginError) {
                                    Navigator.pop(_dialogKey.currentContext);
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                          );
                                        });
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 15.0),
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => SignUpPage()));
                                  _userController.clear();
                                },
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.transparent,
                                  side: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 60.0, vertical: 12.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                ),
                                child: Container(
                                  child: Text(
                                    'ایجاد  حساب  کاربری',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    // Spacer(),

                    //Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
