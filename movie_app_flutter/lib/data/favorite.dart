class Favorite {
  String? backdropPath;
  int? id;
  String? originalTitle;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;

  Favorite(
      {this.id,
      this.backdropPath,
      this.originalTitle,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.voteAverage,
      this.title});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "backdropPath": backdropPath,
      "id": id,
      "originalTitle": originalTitle,
      "popularity": popularity,
      "posterPath": posterPath,
      "releaseDate": releaseDate,
      "title": title,
      "voteAverage": voteAverage
    };
    return map;
  }

  Favorite.fromMap(Map<String, dynamic> map) {
    backdropPath = map["backdropPath"];
    id = map["id"];
    originalTitle = map["originalTitle"];
    popularity = double.parse(map["popularity"]);
    posterPath = map["posterPath"];
    releaseDate = map["releaseDate"];
    title = map["title"];
    voteAverage = double.parse(map["voteAverage"].toString());
  }
}
