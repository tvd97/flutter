import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/const_data.dart';
import 'package:movie_app_flutter/models/casts/cast_movie.dart';
import 'package:movie_app_flutter/models/genres/genres.dart';
import 'package:movie_app_flutter/models/movie/movie.dart';
import 'package:movie_app_flutter/models/movie/video/video.dart';
import 'package:movie_app_flutter/models/person/person.dart';

import '../models/now_playing.dart';
import '../models/popular.dart';

class Network {
  static Future<NowPlaying> fetchNowPlaying(
      {required String path, int page = 1}) async {
    var uri = Uri.parse(
        "${ConstData.url}3/movie/$path?api_key=${ConstData.api_key}&language=en-US&page=$page");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return NowPlaying.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw Exception("Find not found");
    }
    throw Exception("Can't not get data");
  }

  static Future<Popular> fetchPopular(
      {required String path, int page = 1}) async {
    var uri = Uri.parse(
        "${ConstData.url}3/movie/$path?api_key=${ConstData.api_key}&language=en-US&page=$page");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Popular.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw Exception("Find not found");
    }
    throw Exception("Can't not get data");
  }

  static Future<Genres> fetchGenres() async {
    var uri = Uri.parse(
        "${ConstData.url}3/genre/movie/list?api_key=${ConstData.api_key}&language=en-US");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Genres.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw Exception("Find not found");
    }
    throw Exception("Can't not get data");
  }

  static Future<Movie> fetchMovie({required int id}) async {
    var uri = Uri.parse(
        "${ConstData.url}3/movie/$id?api_key=${ConstData.api_key}&language=en-US");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw Exception("Find not found");
    }
    throw Exception("Can't not get data");
  }

  static Future<CastMovie> fetchCastMovie({required int id}) async {
    var uri = Uri.parse(
        "${ConstData.url}3/movie/$id/casts?api_key=${ConstData.api_key}&language=en-US");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return CastMovie.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw Exception("Find not found");
    }
    throw Exception("Can't not get data");
  }

  static Future<Video> fetchMovieTrailer({required int id}) async {
    var uri = Uri.parse(
        "${ConstData.url}3/movie/$id/videos?api_key=${ConstData.api_key}&language=en-US");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Video.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw Exception("Find not found");
    }
    throw Exception("Can't not get data");
  }

  static Future<Person> fetchPerson({required int id}) async {
    var uri = Uri.parse(
        "${ConstData.url}3/person/$id?api_key=${ConstData.api_key}&language=en-US");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Person.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw Exception("Find not found");
    }
    throw Exception("Can't not get data");
  }

  static Future<Popular> fetchMovieByPerson({required int id,int? page}) async {
    var uri = Uri.parse(
        "${ConstData.url}3/discover/movie?api_key=${ConstData.api_key}&language=en-US&with_people=$id&page=$page");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Popular.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw Exception("Find not found");
    }
    throw Exception("Can't not get data");
  }
  static Future<Popular> fetchMovieByGenreId({required int id,int? page=1}) async {
    var uri = Uri.parse(
        "${ConstData.url}3/discover/movie?api_key=${ConstData.api_key}&language=en-US&without_genres=$id&page=$page");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Popular.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw Exception("Find not found");
    }
    throw Exception("Can't not get data");
  }
  static Future<Popular> fetchSearchMovie({required String text,int? page=1}) async {
    var uri = Uri.parse(
        "${ConstData.url}3/search/movie?api_key=${ConstData.api_key}&language=en-US&query=$text&page=$page");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Popular.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw Exception("Find not found");
    }
    throw Exception("Can't not get data");
  }

}
