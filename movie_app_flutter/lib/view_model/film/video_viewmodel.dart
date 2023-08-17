import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/movie/video/video.dart';
import 'package:movie_app_flutter/network/network.dart';

class VideoViewModel with ChangeNotifier {
  Video? _video;

  Video? get video => _video;

  void getMovieTrailerById({required int id}) async {
    _video = await Network.fetchMovieTrailer(id: id);
    notifyListeners();
  }

  void clearData() {
    _video = null;
    notifyListeners();
  }
}
