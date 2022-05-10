class FilmInfo {
  bool adult;
  String srcBackdrop;
  List<int> idGenres;
  int id;
  String language;
  String originalTitle;
  String overview;
  double popularity;
  String srcPoster;
  String releaseDate;
  String title;
  bool video;
  double avgVote;
  int countVote;
  FilmInfo({
    required this.id,
    required this.adult,
    required this.avgVote,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.countVote,
    required this.idGenres,
    required this.language,
    required this.popularity,
    required this.releaseDate,
    required this.srcBackdrop,
    required this.srcPoster,
    required this.video,
  });
  factory FilmInfo.fromJson(Map<String, dynamic> json) {
    List<int> genreids = [];
    for (var item in json['genre_ids']) {
      genreids.add(item);
    }
    return FilmInfo(
        id: json['id'],
        adult: json['adult'],
        avgVote: json['vote_average'],
        title: json['title'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        countVote: json['vote_count'],
        idGenres: genreids,
        language: json['original_language'],
        popularity: json['popularity'],
        releaseDate: json['release_date'],
        srcBackdrop: json['backdrop_path'],
        srcPoster: json['poster_path'],
        video: json['video']);
  }
}
