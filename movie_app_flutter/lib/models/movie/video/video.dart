import 'package:movie_app_flutter/models/movie/video/video_result.dart';

class Video {
  int? id;
  List<VideoResult>? results;

  Video({this.id, this.results});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <VideoResult>[];
      json['results'].forEach((v) {
        results!.add(VideoResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}