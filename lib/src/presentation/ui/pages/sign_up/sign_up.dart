import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodon/core/validator/validator.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/presentation/ui/pages/sign_up/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodon/src/presentation/ui/widgets/flush_bar_success.dart';
import 'package:foodon/src/presentation/ui/widgets/loading_stack.dart';
import 'package:foodon/src/presentation/ui/widgets/text_field.dart';
import 'package:foodon/src/presentation/utils/enums.dart';

import '../../../../../constants.dart';
import '../../../../../locator.dart';

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
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Directionality(
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
                      bottom: SizeConfig.height * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 45.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 45.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ایـجـاد حساب کـاربـری',
                              style: TextStyle(
                                fontSize: 25.0,
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
                      SizedBox(height: 20.0),
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
                              MyTextField(
                                txt: 'نـام خـانـوادگـی',
                                iconData: FontAwesomeIcons.userAlt,
                                controller: _lNameController,
                                validator: validator.validateEmptyFields,
                              ),
                              MyTextField(
                                txt: 'آدرس',
                                iconData: FontAwesomeIcons.mapMarkerAlt,
                                controller: _addressController,
                                validator: validator.validateEmptyFields,
                              ),
                              MyTextField(
                                txt: 'شـمـاره مبـایل',
                                iconData: FontAwesomeIcons.mobile,
                                controller: _phoneController,
                                type: TextInputType.phone,
                                validator: validator.validatePhoneNumber,
                              ),
                              MyTextField(
                                txt: 'رمـز عـبـور',
                                iconData: FontAwesomeIcons.key,
                                controller: _passController,
                                validator: validator.validatePassword,
                              ),
                              SizedBox(height: 80.0),
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
                                                ..fName = _fNameController.text
                                                ..lName = _lNameController.text
                                                ..address =
                                                    _addressController.text
                                                ..phone = _phoneController.text
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
                                          horizontal: 70.0, vertical: 10.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                      ),
                                    ),
                                    child: BlocConsumer(
                                      bloc:
                                          BlocProvider.of<SignUpBloc>(context),
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
                                          width: 60.0,
                                          height: 20.0,
                                          child: Center(
                                            child: Text(
                                              'ایـجـاد',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
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
                                                  Navigator.of(context)
                                                      .pop(true);
                                                });
                                                return AlertDialog(
                                                  title: Text('Error'),
                                                );
                                              });
                                        } else if (state is SignUpSuccess) {
                                          Navigator.pop(
                                              _dialogKey.currentContext);
                                          showFlushBar(context: context);
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
                      SizedBox(height: 50.0)
                    ],
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
