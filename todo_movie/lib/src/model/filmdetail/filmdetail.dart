import 'package:todo_movie/src/model/filmdetail/genres.dart';
import 'package:todo_movie/src/model/filmdetail/languge.dart';
import 'package:todo_movie/src/model/filmdetail/productioncompanies.dart';
import 'package:todo_movie/src/model/filmdetail/productioncountries.dart';


class FilmDetail {
  bool adult;
  String backdropPath;
  String? belongsToCollection;
  int budget;
  Genres genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  String popularity;
  String posterPath;
  List<ProductionCompanies> productionCompanies;
  List<ProductionCountries> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<Languages> languages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  FilmDetail({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.genres,
    required this.budget,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.languages,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}
