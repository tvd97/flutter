import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/popular.dart';
import 'package:movie_app_flutter/view_model/movie_by/movie_by_genre_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../film/film_activity.dart';

class MovieByGenreActivity extends StatelessWidget {
  MovieByGenreActivity({Key? key, required this.id, required this.genre})
      : super(key: key);
  int id;
  String genre;
  Popular? popular;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(genre)),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: ChangeNotifierProvider<MovieByGenreViewModel>(
              create: (_) => MovieByGenreViewModel(id: id),
              builder: (context, widget) {
                popular = context.watch<MovieByGenreViewModel>().popular;
                return RefreshIndicator(
                    child: GridView.builder(
                      controller:
                          context.watch<MovieByGenreViewModel>().controller,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 2 / 3),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return popular == null
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                enabled: true,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 2.0,
                                          bottom: 5.0,
                                          left: 1.0,
                                          right: 3.0),
                                      width: 100.0,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 2.0,
                                          bottom: 5.0,
                                          left: 1.0,
                                          right: 3.0),
                                      width: 100.0,
                                      height: 20.0,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 2.0,
                                          bottom: 0.0,
                                          left: 1.0,
                                          right: 3.0),
                                      width: 100.0,
                                      height: 20.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff000000),
                                      width: 0.5,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FilmActivity(
                                                id: popular!
                                                    .results![index].id!)),
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 0.5,
                                              color: const Color(0xff9a9a9a),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: popular!.results![index]
                                                      .posterPath ==
                                                  null
                                              ? Image.asset("images/bear.jpg")
                                              : Image.network(
                                                  "https://image.tmdb.org/t/p/w200/${popular!.results![index].posterPath!}",
                                                  fit: BoxFit.fitHeight,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                      },
                      itemCount: popular == null ? 8 : popular!.results!.length,
                    ),
                    onRefresh: () async {
                      await Future.delayed(
                        const Duration(seconds: 0, milliseconds: 2000),
                      );
                      context.read<MovieByGenreViewModel>().onRefresh(id: id);
                    });
              }),
        ),
      ),
    );
  }
}
