// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail()
  ..defaults = json['defaults'] == null
      ? null
      : ScreenSize.fromJson(json['defaults'] as Map<String, dynamic>)
  ..medium = json['medium'] == null
      ? null
      : ScreenSize.fromJson(json['medium'] as Map<String, dynamic>)
  ..high = json['high'] == null
      ? null
      : ScreenSize.fromJson(json['high'] as Map<String, dynamic>)
  ..standard = json['standard'] == null
      ? null
      : ScreenSize.fromJson(json['standard'] as Map<String, dynamic>)
  ..maxres = json['maxres'] == null
      ? null
      : ScreenSize.fromJson(json['maxres'] as Map<String, dynamic>);

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'defaults': instance.defaults,
      'medium': instance.medium,
      'high': instance.high,
      'standard': instance.standard,
      'maxres': instance.maxres,
    };
