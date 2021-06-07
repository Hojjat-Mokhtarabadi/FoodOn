import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodon/core/validator/validator.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/presentation/ui/pages/sign_up/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodon/src/presentation/ui/widgets/flush_bar_success.dart';
import 'package:foodon/src/presentation/ui/widgets/loading_progress.dart';
import 'package:foodon/src/presentation/ui/widgets/my_text_field.dart';
import 'package:foodon/src/presentation/utils/enums.dart';
import 'package:foodon/src/presentation/utils/providers/cart_info.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants.dart';
import '../../../../../locator.dart';

const kSizedBoxHeight = 4.0;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _dialogKey = GlobalKey<State>();
  final validator = locator<Validator>();
  TextEditingController _fNameController;
  TextEditingController _lNameController;
  TextEditingController _addressController;
  TextEditingController _phoneController;
  TextEditingController _passController;

  @override
  void initState() {
    super.initState();
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _fNameController.dispose();
    _lNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    final cartInfoProv = Provider.of<CartInfoProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Sizer(
        builder: (context, orientation, deviceType) => Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(kImagesAddress[ImageAddresses.background2]),
                  fit: BoxFit.cover),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15.0)),
                    margin: EdgeInsets.only(
                        left: 25.0,
                        right: 25.0,
                        top: 25.0,
                        bottom: SizeConfig.h * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ایـجـاد حساب کـاربـری',
                                style: TextStyle(
                                  fontSize: 19.sp,
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
                              // IconButton(
                              //     icon: Icon(Icons.arrow_back_ios_outlined),
                              //     onPressed: () {}),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MyTextField(
                                  txt: 'نـام',
                                  iconData: FontAwesomeIcons.userAlt,
                                  controller: _fNameController,
                                  validator: validator.validateEmptyFields,
                                ),
                                SizedBox(height: kSizedBoxHeight),
                                MyTextField(
                                  txt: 'نـام خـانـوادگـی',
                                  iconData: FontAwesomeIcons.userAlt,
                                  controller: _lNameController,
                                  validator: validator.validateEmptyFields,
                                ),
                                SizedBox(height: kSizedBoxHeight),
                                MyTextField(
                                  txt: 'آدرس',
                                  iconData: FontAwesomeIcons.mapMarkerAlt,
                                  controller: _addressController,
                                  validator: validator.validateEmptyFields,
                                ),
                                SizedBox(height: kSizedBoxHeight),
                                MyTextField(
                                  txt: 'شـمـاره موبـایل',
                                  iconData: FontAwesomeIcons.mobile,
                                  controller: _phoneController,
                                  type: TextInputType.phone,
                                  //validator: validator.validatePhoneNumber,
                                ),
                                SizedBox(height: kSizedBoxHeight),
                                MyTextField(
                                  txt: 'رمـز عـبـور',
                                  iconData: FontAwesomeIcons.key,
                                  controller: _passController,
                                  //validator: validator.validatePassword,
                                ),
                                SizedBox(height: 80),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          BlocProvider.of<SignUpBloc>(context)
                                              .add(
                                            SignUpUserEvent(
                                              customer: Customer(
                                                (c) => c
                                                  ..fName =
                                                      _fNameController.text
                                                  ..lName =
                                                      _lNameController.text
                                                  ..address =
                                                      _addressController.text
                                                  ..phone =
                                                      _phoneController.text
                                                  ..password =
                                                      _passController.text,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: kPrimaryColor,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w, vertical: 1.5.h),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                        ),
                                      ),
                                      child: BlocConsumer(
                                        bloc: BlocProvider.of<SignUpBloc>(
                                            context),
                                        builder: (context, state) {
                                          // if (state is SignUpLoading) {
                                          //   return SizedBox(
                                          //     height: 20.0,
                                          //     width: 60.0,
                                          //     child: FittedBox(
                                          //       fit: BoxFit.fitHeight,
                                          //       child:
                                          //           CircularProgressIndicator(
                                          //         backgroundColor: Colors.white,
                                          //         strokeWidth: 3.0,
                                          //       ),
                                          //     ),
                                          //   );
                                          // }
                                          return Container(
                                            width: 45.w,
                                            child: Center(
                                              child: Text(
                                                'ایـجـاد',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        listener: (context, state) {
                                          if (state is SignUpLoading) {
                                            showLoadingProgress(
                                              context: context,
                                              key: _dialogKey,
                                            );
                                          } else if (state is SignUpError) {
                                            Navigator.pop(
                                                _dialogKey.currentContext);
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  Future.delayed(
                                                      Duration(seconds: 2), () {
                                                    Navigator.pop(context);
                                                  });
                                                  return AlertDialog(
                                                    title: Text('Error'),
                                                  );
                                                });
                                          } else if (state is SignUpSuccess) {
                                            Navigator.pop(
                                                _dialogKey.currentContext);
                                            showFlushBar(context: context);
                                            print('success with cartId');
                                            print(state.cartId);
                                            cartInfoProv.setInfo(
                                                cartId: state.cartId);
                                            Future.delayed(
                                              Duration(seconds: 2),
                                              () {
                                                Navigator.pop(context);
                                              },
                                            );
                                            // showDialog(
                                            //     context: context,
                                            //     builder: (c) {
                                            //       Future.delayed(
                                            //           Duration(seconds: 2), () {
                                            //         Navigator.of(c).pop(true);
                                            //         Navigator.pop(context);
                                            //       });
                                            //       return AlertDialog(
                                            //         title: Text('Success'),
                                            //       );
                                            //     });
                                          }
                                        },
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
