// To parse this JSON data, do
//
//     final WatchList = WatchListFromJson(jsonString);

import 'dart:convert';

List<WatchList> watchListFromJson(String str) =>
    List<WatchList>.from(json.decode(str).map((x) => WatchList.fromJson(x)));

String watchListToJson(List<WatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchList {
  WatchList({
    required this.watched,
    required this.rating,
    required this.title,
    required this.releaseDate,
    required this.review,
  });

  bool watched;
  int rating;
  String title;
  String releaseDate;
  String review;

  factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
      watched: json["fields"]["watched"],
      rating: json["fields"]["rating"],
      title: json["fields"]["title"],
      releaseDate: json["fields"]["release_date"],
      review: json["fields"]["review"]);

  Map<String, dynamic> toJson() => {
        "watched": watched,
        "rating": rating,
        "title": title,
        "releaseDate": releaseDate,
        "review": review
      };
}
