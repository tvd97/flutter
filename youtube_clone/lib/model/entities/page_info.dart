import 'package:json_annotation/json_annotation.dart';

part 'page_info.g.dart';

@JsonSerializable()
class PageInfo {
  PageInfo();

  @JsonKey(name: "totalResults")
  int? totalResults;
  @JsonKey(name: "resultsPerPage")
  int? resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) =>
      _$PageInfoFromJson(json);
}
