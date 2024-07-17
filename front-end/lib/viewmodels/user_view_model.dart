import 'package:flutter/material.dart';
import 'package:meald/models/user.dart';
class UserViewModel extends ChangeNotifier {
  final User _user = User(name: '', email: '',password:'');

  String get name => _user.name;
  String get email => _user.email;
  String get password => _user.password;

  void setName(String firstname) {
    _user.name = firstname;
    notifyListeners();
  }

  void setEmail(String email) {
    _user.email= email;
    notifyListeners();
  }
 void setPassword(String password) {
    _user.password = password;
    notifyListeners();
  }
  User getUser() {
    return _user;
  }
}