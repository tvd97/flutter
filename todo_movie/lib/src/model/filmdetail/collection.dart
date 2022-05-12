// ignore_for_file: prefer_collection_literals

class Collection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  Collection({this.id, this.name, this.posterPath, this.backdropPath});

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['poster_path'] = posterPath;
    data['backdrop_path'] = backdropPath;
    return data;
  }
}
