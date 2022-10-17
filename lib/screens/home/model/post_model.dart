// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
    PostModel({
       required this.category,
       required this.language,
       required this.genre,
       required this.sort,
    });

    String category;
    String language;
    String genre;
    String sort;

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        category: json["category"],
        language: json["language"],
        genre: json["genre"],
        sort: json["sort"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "language": language,
        "genre": genre,
        "sort": sort,
    };
}
