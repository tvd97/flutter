import 'package:json_annotation/json_annotation.dart';
import 'package:youtube_clone/model/entities/screen_size.dart';

part 'thumbnail.g.dart';

@JsonSerializable()
class Thumbnail {
  Thumbnail();

  @JsonKey(name: "defaults")
  ScreenSize? defaults;
  @JsonKey(name: "medium")
  ScreenSize? medium;
  @JsonKey(name: "high")
  ScreenSize? high;
  @JsonKey(name: "standard")
  ScreenSize? standard;
  @JsonKey(name: "maxres")
  ScreenSize? maxres;

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
}
