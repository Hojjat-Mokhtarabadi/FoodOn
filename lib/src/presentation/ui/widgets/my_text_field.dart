import 'package:flutter/material.dart';
import 'package:foodon/size_config.dart';

class MyTextField extends StatelessWidget {
  final String txt;
  final TextInputType type;
  final TextEditingController controller;
  final IconData iconData;
  final validator;
  MyTextField({
    @required this.txt,
    this.iconData,
    this.type = TextInputType.text,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    return Theme(
      data: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.black,
              ),
          // primaryColor: Colors.black,
          // accentColor: Colors.white,
          fontFamily: 'Vazir'),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.w * 0.09, vertical: 8),
        child: TextFormField(
          controller: controller,
          keyboardType: type,
          validator: validator,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: txt,
            prefixIcon: Icon(iconData, size: 18.0),
            hintStyle: TextStyle(color: Colors.black38),
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide(color: Colors.black)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
