

import 'package:flutter/material.dart';
import 'package:geeksynergy/screens/signup/provider/signup_provider.dart';
import 'package:provider/provider.dart';

class LoginProvider with ChangeNotifier {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwodcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool visibility = true;
  
//==============visibleset=========//
  visibleupdate() {
    visibility = !visibility;
    notifyListeners();
  }
//=============validate=============//
  validate(BuildContext context) {
    if (formkey.currentState!.validate()) {
      context.read<UserProvider>().checkuser(namecontroller.text.trim(),passwodcontroller.text.trim(),context);
      clearField();
    } else {
      return;
    }
  }
//==========clear==fields==========//
  clearField() {
    namecontroller.clear();
    passwodcontroller.clear();
    
  }
}

