import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/person/person.dart';
import 'package:movie_app_flutter/models/popular.dart';
import 'package:movie_app_flutter/network/network.dart';

class PersonViewModel with ChangeNotifier {
  Person? _person;
  Popular? _movies;
  int id;
  int page = 1;
  final ScrollController _controller = ScrollController();

  PersonViewModel({required this.id}) {
    getPerson(id: id);
    getMovieByPerson(id: id, page: 1);
    _controller.addListener(() async {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        await Future.delayed(
          const Duration(seconds: 0, milliseconds: 2000),
        );
        if (_movies != null && page < _movies!.totalPages!) {
          page++;
          loadMore(id: id, page: page);
        }
        print("object$page");
      }
    });
  }

  ScrollController get controller => _controller;

  Person? get person => _person;

  Popular? get movies => _movies;

  void loadMore({required int id, int? page}) async {
    _movies?.results!.addAll(
        (await Network.fetchMovieByPerson(id: id, page: page)).results!);
    notifyListeners();
  }

  void getPerson({required int id}) async {
    _person = await Network.fetchPerson(id: id);
    notifyListeners();
  }

  void getMovieByPerson({required int id, int? page = 1}) async {
    _movies = await Network.fetchMovieByPerson(id: id, page: page);
    notifyListeners();
  }
}
