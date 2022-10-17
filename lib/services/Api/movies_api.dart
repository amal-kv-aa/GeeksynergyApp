import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:geeksynergy/screens/home/model/home_model.dart';
import 'package:geeksynergy/screens/home/model/post_model.dart';
import 'package:geeksynergy/services/endpoints/api_endpoints.dart';

class GetApi extends ApiEndpoints {
  Future <List<Result>?> getmoviesDetailes(PostModel postData) async {
    try 
    {
      log("2..");
      final response = await Dio().post(baseUrl, data: postData.toJson());
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
      //  log(response.data["result"].toString());
        final data = movieModelFromJson(response.data["result"]);
        log(data[0].genre.toString());
        return data;
      }
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) {
        return null;
      }
      return e.response!.data['error'];
    }
    return null;
  }
}
