import 'package:todo_movie/src/model/listplaying/dateplaying.dart';
import 'package:todo_movie/src/model/listplaying/filminfo.dart';

class FilmOnPlaying {
  DatePlaying? dates;
  int? page;
  List<FilmInfo>? result;
  int? totalPages;
  int? totalResult;
  FilmOnPlaying(
      {this.dates, this.page,  this.result, this.totalPages, this.totalResult});
  factory FilmOnPlaying.fromJson(Map<String, dynamic> json) {
     List<FilmInfo>? results=[];
    for (var item in json['results']) {
      results.add(FilmInfo.fromJson(item));
    }
    return FilmOnPlaying(
        dates: DatePlaying.fromJson(json['dates']),
        result: results,
        page: json['page'],
        totalPages: json['total_pages'],
        totalResult: json['total_results']);
  }
}
