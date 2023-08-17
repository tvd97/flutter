import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/now_playing.dart';
import 'package:movie_app_flutter/models/popular.dart';
import 'package:movie_app_flutter/network/network.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel() {
    getNowPlaying(page: 1);
    getPopular(page: 1);
    getTopRate(page: 1);
    getUpcoming(page: 1);
  }

   NowPlaying? _nowPlaying;
   NowPlaying? _upcoming;
   Popular? _popular;
   Popular? _topRate;

  void getNowPlaying({int page = 1}) async {
    _nowPlaying =
        await Network.fetchNowPlaying(path: "now_playing", page: page);
    notifyListeners();
  }

  void getUpcoming({int page = 1}) async {
    _upcoming = await Network.fetchNowPlaying(path: "upcoming", page: page);
    notifyListeners();
  }

  void getPopular({int page = 1}) async {
    _popular = await Network.fetchPopular(path: "popular", page: page);
    notifyListeners();
  }

  void getTopRate({int page = 1}) async {
    _topRate = await Network.fetchPopular(path: "top_rated", page: page);
    notifyListeners();
  }

  NowPlaying? get nowPlaying => _nowPlaying;

  NowPlaying? get upComing => _upcoming;

  Popular? get popular => _popular;

  Popular? get topRate => _topRate;
}
