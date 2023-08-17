import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/genres/genres.dart';
import 'package:movie_app_flutter/network/network.dart';

class GenreViewModel with ChangeNotifier {
  Genres? _genres;

  Genres? get genres => _genres;

  void getGenres() async {
    _genres = await Network.fetchGenres();
    notifyListeners();
  }
}
