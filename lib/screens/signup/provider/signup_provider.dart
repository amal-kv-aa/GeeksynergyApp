import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynergy/screens/home/view/home.dart';
import 'package:geeksynergy/screens/signup/model/signup_model.dart';
import 'package:geeksynergy/screens/splash/view/splash.dart';
import 'package:geeksynergy/widgets/snackbar/snackbar.dart';
import 'package:hive_flutter/adapters.dart';

class UserProvider with ChangeNotifier {
  UserProvider() {
    getAllData();
  }
  final formkey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();
  final TextEditingController professioncontroller = TextEditingController();

  bool visibility = true;

  final userDb = Hive.box('user_db');

  UserModel? user;

//===============name validation===========//
  String? username(String value) {
    if (value.trim().isEmpty) {
      return 'name required';
    } else if (value.trim().length < 3) {
      return 'Username must be at least 3 characters in length';
    }
    return null;
  }

//===============email validation===========//
  String? emailValidate(String value) {
    if (value.isEmpty) {
      return 'email required';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'email formate invalid';
    }
    return null;
  }

//================phone number==============//
  String? phoneValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'phonenumber required';
    } else if (value.trim().length < 10) {
      return 'enter valid phonenumber';
    }
    return null;
  }

//===================profession==validate=============//
  String? professionValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "field required";
    }
    return null;
  }

//================password==validate===============//
  String? passwordValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'password required';
    } else if (value.trim().length < 8) {
      return 'Password must be at least 8 characters in length';
    }
    return null;
  }

//===============confirm==password==========//
  String? confirmValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'confirmpassword required';
    } else if (value != passwordcontroller.text) {
      return "password not matching";
    }
    return null;
  }

  updateProfession(value) {
    professioncontroller.text = value;
    notifyListeners();
  }

  //===================form validation========//
  validate(BuildContext context) {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      addUser(context);
      return;
    }
  }

  visibleupdate() {
    visibility = !visibility;
    notifyListeners();
  }
  //==========================signup======================//

  void addUser(BuildContext context) {
    final userData = UserModel(
      name: namecontroller.text,
      email: emailcontroller.text,
      password: passwordcontroller.text,
      number: phonenumbercontroller.text,
      profession: professioncontroller.text,
      
    );
    addUserData(userData).then((value) => {
          clearField(),
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>const Home()), (route) => false)
        });
  }

//===============store==data==to==hive=========//
  Future addUserData(UserModel userData) async {
    await userDb.put(0, userData);
    getAllData();
  }

//===============get==data==from==hive=========//
  void getAllData() {
    user = userDb.values.first;
    notifyListeners();
  }

//================checking====user==valid=or=not=====//

  checkuser(String name, String password, BuildContext context) {
    if (name == user!.name && password == user!.password) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => const Home()));
    } else {
      CustomSnackbar.showSnack(context: context, text: "No user");
    }
  }

//=============dropdown==list==========//
  List<DropdownMenuItem<String>> getUserDropDown(List users) {
    List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i < users.length; i++) {
      items.add(DropdownMenuItem(
        value: users[i],
        child: Text(users[i]),
      ));
    }
    return items;
  }

  clearField() {
    namecontroller.clear();
    phonenumbercontroller.clear();
    emailcontroller.clear();
    passwordcontroller.clear();
    confirmcontroller.clear();
    professioncontroller.clear();
  }

  //====================account================//
  accountInfo(BuildContext context) {
    showDialog(
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            backgroundColor: Theme.of(context).backgroundColor,
            title:   Center(child: Text(user?.name ??"",style: const TextStyle(color: Colors.white),)),
            content: SizedBox(
              height: 160.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(user?.email ?? "",style: const TextStyle(color: Colors.white70),),
                  SizedBox(
                    height: 5.h,
                  ),
                   Text("ph : ${user?.number ?? ""}",style: const TextStyle(color: Colors.white70),),
                  SizedBox(
                    height: 5.h,
                  ),
                   Text("profession : ${user?.profession ?? ""}",style: const TextStyle(color: Colors.white70),),
                   SizedBox(height: 40.h,),
                   ElevatedButton(onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>const Splash()), (route) => false);
                   },style: ElevatedButton.styleFrom(primary: Colors.white), child:  Text("log-out",style: TextStyle(color: Theme.of(context).backgroundColor),),)
                ],
              ),
            ),
          );
        });
  }
}
