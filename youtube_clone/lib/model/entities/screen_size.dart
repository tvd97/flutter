import 'package:json_annotation/json_annotation.dart';

part 'screen_size.g.dart';

@JsonSerializable()
class ScreenSize {
  ScreenSize();

  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "width")
  int? width;
  @JsonKey(name: "height")
  int? height;

  factory ScreenSize.fromJson(Map<String, dynamic> json) =>
      _$ScreenSizeFromJson(json);
}
