import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/popular.dart';
import 'package:movie_app_flutter/network/network.dart';

class MovieByGenreViewModel with ChangeNotifier {
  Popular? _popular;
  int page = 1;
  int id;
  final ScrollController _controller = ScrollController();

  MovieByGenreViewModel({required this.id}) {
    getMovieByGenre(id: id, page: page);
    _controller.addListener(() async {

      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        await Future.delayed(
          const Duration(seconds: 0, milliseconds: 2000),
        );
        page++;
        loadMore(id: id, page: page);
        print("object$page");
      }
    });
  }

  Popular? get popular => _popular;

  ScrollController get controller => _controller;

  void getMovieByGenre({required int id, int? page = 1}) async {
    _popular = await Network.fetchMovieByGenreId(id: id, page: page);
    notifyListeners();
  }

  void loadMore({required int id, int? page}) async {
    _popular!.results!.addAll(
        (await Network.fetchMovieByGenreId(id: id, page: page)).results!);
    notifyListeners();

  }

  void onRefresh({required int id}) async {
    _popular = await Network.fetchMovieByGenreId(id: id, page: 1);
    notifyListeners();
  }
}
