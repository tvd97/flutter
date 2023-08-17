import 'package:flutter/material.dart';
import 'package:movie_app_flutter/data/favorite.dart';
import 'package:movie_app_flutter/data/sql_database_movie_app.dart';

class FavoriteViewModel with ChangeNotifier {
  late DatabaseHelper _helper;
  List<Favorite>? _favorite;

  FavoriteViewModel() {
    _helper = DatabaseHelper();
    getFavorite();
  }

  List<Favorite>? get favorite => _favorite;

  void getFavorite() async {
    _favorite = await _helper.getFavorites();
    notifyListeners();
  }

  void remove(int id) async {
    await _helper.delete(id);
    _favorite = await _helper.getFavorites();
    notifyListeners();
  }
}
