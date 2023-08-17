// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video()
  ..kind = json['kind'] as String?
  ..etag = json['etag'] as String?
  ..id = json['id'] is String? (json['id'] as String?): (json['id'] as Map<String,dynamic>)["videoId"] as String?
  ..snippet = json['snippet'] == null
      ? null
      : Snippet.fromJson(json['snippet'] as Map<String, dynamic>)
  ..player = json['player'] == null
      ? null
      : Player.fromJson(json['player'] as Map<String, dynamic>);

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
      'snippet': instance.snippet,
      'player': instance.player,
    };
