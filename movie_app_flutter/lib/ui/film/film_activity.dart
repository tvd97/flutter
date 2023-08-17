// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/casts/cast.dart';
import 'package:movie_app_flutter/models/casts/cast_movie.dart';
import 'package:movie_app_flutter/models/casts/crew.dart';
import 'package:movie_app_flutter/models/movie/movie.dart';
import 'package:movie_app_flutter/ui/movie_by/movie_by_genre.dart';
import 'package:movie_app_flutter/view_model/film/film_view_model.dart';
import 'package:movie_app_flutter/ui/film/trailer/youtube_view.dart';
import 'package:movie_app_flutter/ui/person/person_activity.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class FilmActivity extends StatelessWidget {
  FilmActivity({Key? key, required this.id}) : super(key: key);
  int id;
  Movie? movie;
  CastMovie? cast;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => FilmViewModel(id: id),
        child: Consumer<FilmViewModel>(
          builder: (context, viewModel, child) {
            movie = viewModel.movie;
            cast = viewModel.castMovie;
            return Scaffold(
              appBar: AppBar(
                title: Text("${movie == null ? "" : movie!.title}"),
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_outlined,
                  ),
                ),
              ),
              resizeToAvoidBottomInset: false,
              body: movie == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      enabled: true,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                            width: MediaQuery.of(context).size.width,
                            height: 200.0,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                            width: MediaQuery.of(context).size.width,
                            height: 20.0,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                            width: MediaQuery.of(context).size.width,
                            height: 20.0,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                            width: MediaQuery.of(context).size.width,
                            height: 20.0,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                            width: MediaQuery.of(context).size.width,
                            height: 100.0,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                            width: MediaQuery.of(context).size.width,
                            height: 100.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/${movie!.backdropPath}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: (MediaQuery.of(context).size.height / 3 - 50) /
                                2,
                            left: MediaQuery.of(context).size.width / 2 - 20,
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => YoutubeView(
                                              id: movie!.id!,
                                              title: movie!.title!,
                                            )),
                                  );
                                },
                                child: const Icon(Icons.play_circle,
                                    color: Color(0xffffffff), size: 40.0),
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 3 - 50.0,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 8.0,
                                  left: 10.0,
                                  bottom: 5.0),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height +
                                  50.0 -
                                  MediaQuery.of(context).size.height / 3,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0))),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          movie!.title!,
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              context
                                                  .read<FilmViewModel>()
                                                  .insertDB(movie!);
                                            },
                                            child: const Icon(
                                                Icons.bookmark_outline)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xffffff00),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "${movie!.voteAverage}/10 IMDb",
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      height: 35.0,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: movie!.genres!.length,
                                        itemBuilder: (_, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MovieByGenreActivity(
                                                    id: movie!
                                                        .genres![index].id!,
                                                    genre: movie!
                                                        .genres![index].name!,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 0,
                                                  top: 0,
                                                  bottom: 0,
                                                  right: 10.0),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              decoration: const BoxDecoration(
                                                color: Color(0xff33FFFF),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0),
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(movie!
                                                      .genres![index].name!)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Length"),
                                            Text(
                                              "${movie!.runtime!} min",
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Language"),
                                            Text(
                                              movie!.spokenLanguages![0].name!,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Rate count"),
                                            Text(
                                              "${movie!.voteCount!}",
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Description",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(movie!.overview!),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 150,
                                      child: buildUICast(context, cast?.cast),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 250,
                                        child: buildUICrew(context, cast?.crew))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget buildUICast(BuildContext context, List<Cast>? list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cast",
          style: TextStyle(
            fontSize: 15.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 130,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: list == null ? 8 : list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return list == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      enabled: true,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                            width: 70.0,
                            height: 100.0,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 2.0, bottom: 0.0, left: 1.0, right: 3.0),
                            width: 70.0,
                            height: 20.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonActivity(
                              id: list[index].id!,
                            ),
                          ),
                        )
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 0, right: 8.0, left: 0, bottom: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 70.0,
                              decoration: const BoxDecoration(
                                color: Color(0xff33FFFF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: list[index].profilePath == null
                                  ? Image.asset(
                                      "images/avatar_none.jpg",
                                      fit: BoxFit.fill,
                                      width: 70.0,
                                      height: 100,
                                    )
                                  : Image.network(
                                      "https://image.tmdb.org/t/p/w200${list[index].profilePath}",
                                      fit: BoxFit.fill,
                                      width: 70.0,
                                    ),
                            ),
                            Text(
                              list[index].name!,
                              style: const TextStyle(fontSize: 8.0),
                            )
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  Widget buildUICrew(BuildContext context, List<Crew>? list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Crew",
          style: TextStyle(
            fontSize: 15.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 130,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: list == null ? 8 : list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return list == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      enabled: true,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                            width: 70.0,
                            height: 100.0,
                            color: Colors.white,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 2.0, bottom: 0.0, left: 1.0, right: 3.0),
                            width: 100.0,
                            height: 20.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonActivity(
                              id: list[index].id!,
                            ),
                          ),
                        )
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 0, right: 8.0, left: 0, bottom: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 70.0,
                              decoration: const BoxDecoration(
                                color: Color(0xff33FFFF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: list[index].profilePath == null
                                  ? Image.asset(
                                      "images/avatar_none.jpg",
                                      fit: BoxFit.fill,
                                      width: 70.0,
                                      height: 100,
                                    )
                                  : Image.network(
                                      "https://image.tmdb.org/t/p/w200${list[index].profilePath}",
                                      fit: BoxFit.fill,
                                      width: 70.0,
                                    ),
                            ),
                            Text(
                              list[index].name!,
                              style: const TextStyle(fontSize: 8.0),
                            )
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}
