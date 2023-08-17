import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/popular.dart';
import 'package:movie_app_flutter/network/network.dart';

class SearchViewModel with ChangeNotifier {
  Popular? _search;

  int page = 1;
  String? text;

  Popular? get search => _search;
  final ScrollController _controller = ScrollController();
  ScrollController get controller => _controller;
  SearchViewModel() {
    _controller.addListener(() async {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        await Future.delayed(
          const Duration(seconds: 0, milliseconds: 2000),
        );
        page++;
        loadMore(text: text!, page: page);
        print("object$page");
      }
    });
  }

  void searchMovie({required String text, int? page = 1}) async {
    this.text = text;
    _search = await Network.fetchSearchMovie(text: text, page: page);
    notifyListeners();
  }

  void loadMore({required String text, int? page}) async {
    _search!.results!.addAll(
        (await Network.fetchSearchMovie(text: text, page: page)).results!);
    notifyListeners();
  }
}
