class BelongToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  BelongToCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['poster_path'] = posterPath;
    data['backdrop_path'] = backdropPath;
    return data;
  }
}
