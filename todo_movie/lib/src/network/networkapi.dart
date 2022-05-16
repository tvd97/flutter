import 'package:todo_movie/src/model/filmdetail/filmdetail.dart';
import 'package:todo_movie/src/model/filmdetail/imagefilm.dart';
import 'package:todo_movie/src/model/listplaying/filmonplay.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_movie/src/model/person/person.dart';

class NetworkAPI {
  Future<FilmOnPlaying> fetchFilmAPI( String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return FilmOnPlaying.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('load fail data');
    }
  }

  Future<DetailFilm> fetchDetailFimlfromAPI( String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return DetailFilm.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('load fail data');
    }
  }
   Future<ImageFIlm> fetchImagelFiml( String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ImageFIlm.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('load fail data');
    }
  }
   Future<Person> fetchPerson( String url)async{
     final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Person.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('load fail data');
    }
  }
}
