
// using for upcoming and now playing
import 'package:movie_app_flutter/models/date.dart';
import 'package:movie_app_flutter/models/result.dart';

class NowPlaying {
  Date? dates;
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  NowPlaying(
      {this.dates,
        this.page,
        this.results,
        this.totalPages,
        this.totalResults});

  NowPlaying.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? Date.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <Result>[];
      json['results'].forEach((v) {
        results!.add(Result.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dates != null) {
      data['dates'] = dates!.toJson();
    }
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}