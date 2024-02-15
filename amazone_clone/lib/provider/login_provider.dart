import 'dart:convert';

import 'package:amazone_clone/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {

  User _user=User(id: "",
   name: "", 
   password: "",
    email: "", 
    address: "", 
    type: "",
     token: "");

  User get user=>_user;
  void setUser(String user){
    final Map<String,dynamic> userData =jsonDecode(user);
_user= User.fromMap(userData);
notifyListeners();
  }
}