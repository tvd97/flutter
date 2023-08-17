import 'package:json_annotation/json_annotation.dart';

part 'localized.g.dart';

@JsonSerializable()
class Localized {
  Localized();

  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;

  factory Localized.fromJson(Map<String, dynamic> json) =>
      _$LocalizedFromJson(json);
}
