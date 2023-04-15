// To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);

import 'dart:convert';

class MoviesModel {
  MoviesModel({
    this.total,
    this.page,
    this.pages,
    this.tvShows,
  });

  final String? total;
  final int? page;
  final int? pages;
  final List<TvShow>? tvShows;

  factory MoviesModel.fromRawJson(String str) => MoviesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
    total: json["total"],
    page: json["page"],
    pages: json["pages"],
    tvShows: json["tv_shows"] == null ? [] : List<TvShow>.from(json["tv_shows"]!.map((x) => TvShow.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "pages": pages,
    "tv_shows": tvShows == null ? [] : List<dynamic>.from(tvShows!.map((x) => x.toJson())),
  };
}

class TvShow {
  TvShow({
    this.id,
    this.name,
    this.permalink,
    this.startDate,
    this.endDate,
    this.country,
    this.network,
    this.status,
    this.imageThumbnailPath,
  });

  final int? id;
  final String? name;
  final String? permalink;
  final DateTime? startDate;
  final dynamic endDate;
  final Country? country;
  final String? network;
  final Status? status;
  final String? imageThumbnailPath;

  factory TvShow.fromRawJson(String str) => TvShow.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TvShow.fromJson(Map<String, dynamic> json) => TvShow(
    id: json["id"],
    name: json["name"],
    permalink: json["permalink"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"],
    country: countryValues.map[json["country"]]!,
    network: json["network"],
    status: statusValues.map[json["status"]]!,
    imageThumbnailPath: json["image_thumbnail_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "permalink": permalink,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": endDate,
    "country": countryValues.reverse[country],
    "network": network,
    "status": statusValues.reverse[status],
    "image_thumbnail_path": imageThumbnailPath,
  };
}

enum Country { US, JP, UK, CA }

final countryValues = EnumValues({
  "CA": Country.CA,
  "JP": Country.JP,
  "UK": Country.UK,
  "US": Country.US
});

enum Status { RUNNING, ENDED }

final statusValues = EnumValues({
  "Ended": Status.ENDED,
  "Running": Status.RUNNING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
