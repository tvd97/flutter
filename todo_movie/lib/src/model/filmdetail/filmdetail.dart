// ignore_for_file: prefer_collection_literals

import 'package:todo_movie/src/model/filmdetail/collection.dart';
import 'package:todo_movie/src/model/filmdetail/companies.dart';
import 'package:todo_movie/src/model/filmdetail/countries.dart';
import 'package:todo_movie/src/model/filmdetail/genres.dart';
import 'package:todo_movie/src/model/filmdetail/languge.dart';

class DetailFilm {
  bool? adult;
  String? backdropPath;
  Collection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<Companies>? productionCompanies;
  List<Countries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<Languages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  DetailFilm(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory DetailFilm.fromJson(Map<String, dynamic> json) {
    List<Genres> genres = [];
    List<Companies> companies = [];
    List<Countries> countries = [];
    List<Languages> languages = [];
    if (json['genres'] != null) {
      json['genres'].forEach((v) {
        genres.add(Genres.fromJson(v));
      });
    }
    if (json['production_companies'] != null) {
      json['production_companies'].forEach((v) {
        companies.add(Companies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      json['production_countries'].forEach((v) {
        countries.add(Countries.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      json['spoken_languages'].forEach((v) {
        languages.add( Languages.fromJson(v));
      });
    }
    return DetailFilm(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'] != null
          ? Collection.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'],
      genres: genres,
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: companies,
      productionCountries: countries,
      spokenLanguages: languages,
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (belongsToCollection != null) {
      data['belongs_to_collection'] = belongsToCollection!.toJson();
    }
    data['budget'] = budget;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    if (productionCompanies != null) {
      data['production_companies'] =
          productionCompanies!.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      data['production_countries'] =
          productionCountries!.map((v) => v.toJson()).toList();
    }
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    if (spokenLanguages != null) {
      data['spoken_languages'] =
          spokenLanguages!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
