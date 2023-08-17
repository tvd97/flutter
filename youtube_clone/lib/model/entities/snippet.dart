import 'package:json_annotation/json_annotation.dart';
import 'package:youtube_clone/model/entities/localized.dart';
import 'package:youtube_clone/model/entities/thumbnail.dart';

part 'snippet.g.dart';

@JsonSerializable()
class Snippet {
  Snippet();

  @JsonKey(name: "publishedAt")
  String? publishedAt;
  @JsonKey(name: "channelId")
  String? channelId;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "thumbnails")
  Thumbnail? thumbnails;
  @JsonKey(name: "channelTitle")
  String? channelTitle;
  @JsonKey(name: "tags")
  List<String>? tags;
  @JsonKey(name: "categoryId")
  String? categoryId;
  @JsonKey(name: "liveBroadcastContent")
  String? liveBroadcastContent;
  @JsonKey(name: "defaultLanguage")
  String? defaultLanguage;
  @JsonKey(name: "localized")
  Localized? localized;
  @JsonKey(name: "defaultAudioLanguage")
  String? defaultAudioLanguage;

  factory Snippet.fromJson(Map<String, dynamic> json) =>
      _$SnippetFromJson(json);
}
