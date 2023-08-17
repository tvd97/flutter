import 'package:flutter/material.dart';
import 'package:movie_app_flutter/data/favorite.dart';
import 'package:movie_app_flutter/models/casts/cast_movie.dart';
import 'package:movie_app_flutter/models/movie/movie.dart';
import 'package:movie_app_flutter/network/network.dart';

import '../../data/sql_database_movie_app.dart';

class FilmViewModel with ChangeNotifier {
  int id;
  Movie? _movie;
  CastMovie? _castMovie;

  late DatabaseHelper _helper;

  FilmViewModel({required this.id}) {
    getMovie(id: id);
    getCastMovie(id: id);
    _helper = DatabaseHelper();
  }

  void getMovie({required int id}) async {
    _movie = await Network.fetchMovie(id: id);
    notifyListeners();
  }

  void getCastMovie({required int id}) async {
    _castMovie = await Network.fetchCastMovie(id: id);
    notifyListeners();
  }

  void insertDB(Movie result) async {
    Favorite favorite = Favorite(
        id: result.id,
        title: result.title,
        backdropPath: result.backdropPath,
        originalTitle: result.originalTitle,
        popularity: result.popularity,
        posterPath: result.posterPath,
        releaseDate: result.releaseDate,
        voteAverage: result.voteAverage);
    _helper.save(favorite);
    _helper.close();
  }

  Movie? get movie => _movie;

  CastMovie? get castMovie => _castMovie;
}
