import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/core/validator/validator.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/user_info_bloc/user_info_bloc.dart';
import 'package:foodon/src/presentation/ui/widgets/flush_bar_success.dart';
import 'package:foodon/src/presentation/ui/widgets/loading_stack.dart';
import 'package:foodon/src/presentation/ui/widgets/text_field.dart';
import 'package:foodon/src/presentation/ui/widgets/top_header.dart';
import 'package:foodon/src/presentation/utils/providers/user_id.dart';
import 'package:provider/provider.dart';

import '../../../../../locator.dart';

class UpdateUserInformationPage extends StatefulWidget {
  final id;
  final firstName;
  final lastName;
  final address;
  final phone;
  final pass;
  const UpdateUserInformationPage({
    Key key,
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.address,
    @required this.phone,
    @required this.pass,
  }) : super(key: key);

  @override
  _UpdateUserInformationPageState createState() =>
      _UpdateUserInformationPageState();
}

class _UpdateUserInformationPageState extends State<UpdateUserInformationPage> {
  final _formKey = GlobalKey<FormState>();
  final _dialogKey = GlobalKey<State>();
  final validator = locator<Validator>();
  bool shouldIgnore = false;
  TextEditingController _fNameController;
  TextEditingController _lNameController;
  TextEditingController _addressController;
  TextEditingController _phoneController;
  TextEditingController _passController;

  @override
  void initState() {
    super.initState();
    shouldIgnore = false;
    _fNameController = TextEditingController(text: widget.firstName);
    _lNameController = TextEditingController(text: widget.lastName);
    _addressController = TextEditingController(text: widget.address);
    _phoneController = TextEditingController(text: widget.phone);
    _passController = TextEditingController(text: widget.pass);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    final prov = Provider.of<UserInfoProvider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: kBackgroundImageBox,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                  key: _formKey,
                  child: BlocConsumer(
                    bloc: BlocProvider.of<UserInfoBloc>(context),
                    builder: (context, state) {
                      if (state is UserInfoLoaded) {
                        return Column(
                          children: [
                            TopHeader(headerName: 'ویرایش پروفایل'),
                            SizedBox(height: 40),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  //shrinkWrap: true,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: MyTextField(
                                            txt: 'نام',
                                            iconData: FontAwesomeIcons.userAlt,
                                            controller: _fNameController,
                                            validator:
                                                validator.validateEmptyFields,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            PhysicalModel(
                                              color: Colors.white,
                                              elevation: 6.0,
                                              shadowColor: kShadowColor,
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              child: CircleAvatar(
                                                radius: 40,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.person,
                                                  size: 28.0,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12.0,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: SizeConfig.width * 0.09,
                                        )
                                      ],
                                    ),
                                    //SizedBox(height: 15.0),
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
                                    SizedBox(
                                      height: SizeConfig.height * 0.12,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: IgnorePointer(
                                        ignoring: shouldIgnore,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              BlocProvider.of<
                                                          UpdateUserInfoBloc>(
                                                      context)
                                                  .add(
                                                      UpdateCurrentUserInfoEvent(
                                                          customer: Customer(
                                                (c) => c
                                                  ..id = widget.id
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
                                              )));
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: kPrimaryColor,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 70.0,
                                                vertical: 10.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(35.0),
                                            ),
                                          ),
                                          child: BlocConsumer(
                                            bloc: BlocProvider.of<
                                                UpdateUserInfoBloc>(context),
                                            builder: (context, state) {
                                              // if (state
                                              //     is UpdateUserInfoLoading) {
                                              //   return SizedBox(
                                              //     height: 20.0,
                                              //     width: 60.0,
                                              //     child: FittedBox(
                                              //       fit: BoxFit.fitHeight,
                                              //       child:
                                              //           CircularProgressIndicator(
                                              //         backgroundColor:
                                              //             Colors.white,
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
                                                    'ویرایش',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            listener: (context, state) {
                                              if (state
                                                  is UpdateUserInfoLoading) {
                                                showLoadingProgress(
                                                    context: context,
                                                    key: _dialogKey);
                                              } else if (state
                                                  is UpdateUserInfoError) {
                                                Navigator.pop(
                                                    _dialogKey.currentContext);
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Text('Error'),
                                                      );
                                                    });
                                              } else if (state
                                                  is UpdateUserInfoSuccess) {
                                                Navigator.pop(
                                                    _dialogKey.currentContext);
                                                showFlushBar(context: context);
                                                prov.setInfo(
                                                  userId: widget.id,
                                                  firstName:
                                                      _fNameController.text,
                                                  lastName:
                                                      _lNameController.text,
                                                  phone: _phoneController.text,
                                                  address:
                                                      _addressController.text,
                                                  pass: _passController.text,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30)
                                  ],
                                ),
                              ),
                            ),
                            //Spacer(),
                          ],
                        );
                      } else if (state is UserInfoLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Container();
                    },
                    listener: (BuildContext context, state) {},
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
