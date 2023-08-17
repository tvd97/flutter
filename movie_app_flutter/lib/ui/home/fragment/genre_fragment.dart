import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/genres/genres.dart';
import 'package:movie_app_flutter/ui/movie_by/movie_by_genre.dart';
import 'package:movie_app_flutter/view_model/home/genres_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class GenresFragment extends StatelessWidget {
  GenresFragment({Key? key}) : super(key: key);
  Genres? genres;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppBar(
        title: const Center(
          child: Text(
            "Genres",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            kBottomNavigationBarHeight -
            30,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ChangeNotifierProvider(
            create: (_) => GenreViewModel(),
            child:
                Consumer<GenreViewModel>(builder: (context, viewModel, child) {
              viewModel.getGenres();
              genres = viewModel.genres;
              return Column(
                children: [
                  ...List<Widget>.generate(
                    genres == null ? 10 : genres!.genres!.length,
                    (index) => genres == null
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            enabled: true,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                              width: MediaQuery.of(context).size.width,
                              height: 100.0,
                              color: Colors.white,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MovieByGenreActivity(
                                            id: genres!.genres![index].id!,
                                            genre:
                                                genres!.genres![index].name!),
                                  ));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xffd9f6a6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              margin: const EdgeInsets.only(
                                  top: 2.0, bottom: 5.0, left: 5.0, right: 5.0),
                              width: MediaQuery.of(context).size.width,
                              height: 100.0,
                              child: Center(
                                  child: Text(
                                "${genres!.genres![index].name}",
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    ]);
  }
}
