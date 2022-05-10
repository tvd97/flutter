import 'package:todo_movie/src/model/listplaying/listfilmonplay.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkAPI {
  NetworkAPI(this.url);
  String url;
  Future<ListFilmOnPlaying> featchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ListFilmOnPlaying.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('load fail data');
    }
  }
}
