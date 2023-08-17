import 'package:movie_app_flutter/models/genres/genre.dart';
import 'package:movie_app_flutter/models/movie/belong_to_collection.dart';
import 'package:movie_app_flutter/models/movie/production_company.dart';
import 'package:movie_app_flutter/models/movie/production_country.dart';
import 'package:movie_app_flutter/models/movie/spoken_language.dart';

class Movie {
	bool? adult;
	String? backdropPath;
	BelongToCollection? belongsToCollection;
	int? budget;
	List<Genre>? genres;
	String? homepage;
	int? id;
	String? imdbId;
	String? originalLanguage;
	String? originalTitle;
	String? overview;
	double? popularity;
	String? posterPath;
	List<ProductionCompany>? productionCompanies;
	List<ProductionCountry>? productionCountries;
	String? releaseDate;
	int? revenue;
	int? runtime;
	List<SpokenLanguage>? spokenLanguages;
	String? status;
	String? tagline;
	String? title;
	bool? video;
	double? voteAverage;
	int? voteCount;

	Movie({this.adult, this.backdropPath, this.belongsToCollection, this.budget, this.genres, this.homepage, this.id, this.imdbId, this.originalLanguage, this.originalTitle, this.overview, this.popularity, this.posterPath, this.productionCompanies, this.productionCountries, this.releaseDate, this.revenue, this.runtime, this.spokenLanguages, this.status, this.tagline, this.title, this.video, this.voteAverage, this.voteCount});

	Movie.fromJson(Map<String, dynamic> json) {
		adult = json['adult'];
		backdropPath = json['backdrop_path'];
		belongsToCollection = json['belongs_to_collection'] != null ? BelongToCollection.fromJson(json['belongs_to_collection']) : null;
		budget = json['budget'];
		if (json['genres'] != null) {
			genres = <Genre>[];
			json['genres'].forEach((v) { genres!.add(Genre.fromJson(v)); });
		}
		homepage = json['homepage'];
		id = json['id'];
		imdbId = json['imdb_id'];
		originalLanguage = json['original_language'];
		originalTitle = json['original_title'];
		overview = json['overview'];
		popularity = json['popularity'];
		posterPath = json['poster_path'];
		if (json['production_companies'] != null) {
			productionCompanies = <ProductionCompany>[];
			json['production_companies'].forEach((v) { productionCompanies!.add(ProductionCompany.fromJson(v)); });
		}
		if (json['production_countries'] != null) {
			productionCountries = <ProductionCountry>[];
			json['production_countries'].forEach((v) { productionCountries!.add(ProductionCountry.fromJson(v)); });
		}
		releaseDate = json['release_date'];
		revenue = json['revenue'];
		runtime = json['runtime'];
		if (json['spoken_languages'] != null) {
			spokenLanguages = <SpokenLanguage>[];
			json['spoken_languages'].forEach((v) { spokenLanguages!.add(SpokenLanguage.fromJson(v)); });
		}
		status = json['status'];
		tagline = json['tagline'];
		title = json['title'];
		video = json['video'];
		voteAverage = json['vote_average'];
		voteCount = json['vote_count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
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
      data['production_companies'] = productionCompanies!.map((v) => v.toJson()).toList();
    }
		if (productionCountries != null) {
      data['production_countries'] = productionCountries!.map((v) => v.toJson()).toList();
    }
		data['release_date'] = releaseDate;
		data['revenue'] = revenue;
		data['runtime'] = runtime;
		if (spokenLanguages != null) {
      data['spoken_languages'] = spokenLanguages!.map((v) => v.toJson()).toList();
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