import 'package:json_annotation/json_annotation.dart';
import 'package:youtube_clone/model/entities/player.dart';
import 'package:youtube_clone/model/entities/snippet.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  Video();

  @JsonKey(name: "kind")
  String? kind;
  @JsonKey(name: "etag")
  String? etag;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "snippet")
  Snippet? snippet;
  @JsonKey(name: "player")
  Player? player;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
