import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynergy/screens/home/model/home_model.dart';
import 'package:geeksynergy/screens/home/model/post_model.dart';
import 'package:geeksynergy/screens/signup/model/signup_model.dart';
import 'package:geeksynergy/screens/signup/provider/signup_provider.dart';
import 'package:geeksynergy/services/Api/movies_api.dart';
import 'package:provider/provider.dart';

class HomeProvider with ChangeNotifier {
  List<Result>? movieData;
//==========fetch==datas=from====api===========//
  void fetchDatas() {
    log("1..");
    final data = PostModel(
        category: "movies", language: "kannada", genre: "all", sort: "voting");
    GetApi().getmoviesDetailes(data).then((value) => {
          if (value != null)
            {movieData = value, notifyListeners()}
          else{
            
          }
        });
  }

//================alert==for==show==companyinfo============//
  companyinfo(BuildContext context) {
    showDialog(
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            backgroundColor: Theme.of(context).backgroundColor,
            title:  const Text("Geeksynergy Technologies Pvt Ltd",style: TextStyle(color: Colors.white),),
            content: SizedBox(
              height: 100.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Address : Sanjayanagar, Bengaluru-56",style: TextStyle(color: Colors.white70),),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Text("Phone: XXXXXXXXX09",style: TextStyle(color: Colors.white70),),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Text("Email xxxxxxx@gmail.com",style: TextStyle(color: Colors.white70),)
                ],
              ),
            ),
          );
        });
  }
}
