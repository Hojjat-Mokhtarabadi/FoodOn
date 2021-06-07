import 'package:flutter/cupertino.dart';

class UserInfoProvider extends ChangeNotifier {
  int id = 0;
  String firstName = "";
  String lastName = "";
  String phone = "";
  String address = "";
  String password = "";
  void setInfo({
    int userId,
    String firstName,
    String lastName,
    String phone,
    String address,
    String pass,
  }) {
    id = userId;
    this.firstName = firstName;
    this.lastName = lastName;
    this.phone = phone;
    this.address = address;
    this.password = pass;
    notifyListeners();
  }
}
