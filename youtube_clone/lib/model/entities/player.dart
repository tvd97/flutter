import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  Player();

  @JsonKey(name: "embedHtml")
  String? embedHtml;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
