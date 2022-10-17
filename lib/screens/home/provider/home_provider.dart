import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:geeksynergy/screens/home/model/home_model.dart';
import 'package:geeksynergy/screens/home/model/post_model.dart';
import 'package:geeksynergy/services/Api/movies_api.dart';

class HomeProvider with ChangeNotifier {

List<Result>? movieData ;

  void fetchDatas() {
    log("1..");
    final data = PostModel(
        category: "movies", language: "kannada", genre: "all", sort: "voting");
    GetApi().getmoviesDetailes(data).then((value) => {

          if (value != null) {
            movieData = value ,
            notifyListeners()} else {
              
              log("failde")}
        });
  }
}
