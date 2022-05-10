import 'package:todo_movie/src/model/listplaying/dateplaying.dart';
import 'package:todo_movie/src/model/listplaying/filminfo.dart';

class ListFilmOnPlaying {
  DatePlaying? dates;
  int? page;
  List<FilmInfo> result;
  int? totalPages;
  int? totalResult;
  ListFilmOnPlaying(
      {this.dates, this.page, required this.result, this.totalPages, this.totalResult});
  factory ListFilmOnPlaying.fromJson(Map<String, dynamic> json) {
    List<FilmInfo> results = [];
    for (var item in json['results']) {
      results.add(FilmInfo.fromJson(item));
    }
    return ListFilmOnPlaying(
        dates: DatePlaying.fromJson(json['dates']),
        result: results,
        page: json['page'],
        totalPages: json['total_pages'],
        totalResult: json['total_results']);
  }
}
