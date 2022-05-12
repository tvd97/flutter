// ignore_for_file: prefer_collection_literals

class Languages {
  String? englishName;
  String? iso6391;
  String? name;

  Languages({this.englishName, this.iso6391, this.name});

  factory Languages.fromJson(Map<String, dynamic> json) {
    return Languages(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['english_name'] = englishName;
    data['iso_639_1'] = iso6391;
    data['name'] = name;
    return data;
  }
}
