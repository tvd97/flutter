import 'package:json_annotation/json_annotation.dart';
import 'package:youtube_clone/model/entities/page_info.dart';
import 'package:youtube_clone/model/entities/video.dart';
part 'video_response.g.dart';
@JsonSerializable()
class VideoResponse {
  VideoResponse();
  @JsonKey(name: "kind")
  String? kind;
  @JsonKey(name: "etag")
  String? etag;
  @JsonKey(name: "items")
  List<Video>? items;
  @JsonKey(name: "nextPageToken")
  String? nextPageToken;
  @JsonKey(name: "pageInfo")
  PageInfo? pageInfo;

  factory VideoResponse.fromJson(Map<String, dynamic> json) => _$VideoResponseFromJson(json);

}
