import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/now_playing.dart';
import 'package:movie_app_flutter/models/popular.dart';
import 'package:movie_app_flutter/models/result.dart';
import 'package:movie_app_flutter/ui/film/film_activity.dart';
import 'package:movie_app_flutter/view_model/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeFragment extends StatelessWidget {
  HomeFragment({Key? key}) : super(key: key);
  NowPlaying? nowPlaying;
  NowPlaying? upcoming;
  Popular? topRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        scrollDirection: Axis.vertical,
        child: ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
          child: Consumer<HomeViewModel>(
            builder: (context, viewModel, child) {
              nowPlaying = viewModel.nowPlaying;
              topRate = viewModel.topRate;
              upcoming = viewModel.upComing;
              return Column(
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Now Playing",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                              fontSize: 20.0),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        buildItemUI(context,
                            nowPlaying == null ? null : nowPlaying!.results)
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Upcoming",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                              fontSize: 20.0),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        buildItemUI(context,
                            upcoming == null ? null : upcoming!.results),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Top Rate",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                              fontSize: 20.0),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        buildItemUI(
                            context, topRate == null ? null : topRate!.results),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildItemUI(BuildContext context, List<Result>? list) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List<Widget>.generate(
            list == null ? 5 : list.length,
            (index) => list == null
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    enabled: true,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                          width: 100.0,
                          height: 130.0,
                          color: Colors.white,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                          width: 100.0,
                          height: 20.0,
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FilmActivity(id: list[index].id!)),
                      );
                    },
                    child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: const Color(0xff9a9a9a),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w200${list[index].posterPath!}",
                                  fit: BoxFit.fill,
                                  height: 260,
                                ),
                              ),
                              const Positioned(
                                  top: 0.0,
                                  left: 0.0,
                                  child: Icon(Icons.add_circle_outline)),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              list[index].title!,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 0, right: 0, bottom: 0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xfffdfd00),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(list[index].voteAverage!.toString()),
                                  const Text("/10 IMDb"),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
