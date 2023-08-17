import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/popular.dart';
import 'package:movie_app_flutter/view_model/home/search_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../film/film_activity.dart';

class SearchFragment extends StatelessWidget {
  SearchFragment({Key? key}) : super(key: key);
  String? text;
  Popular? search;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: ChangeNotifierProvider(
        create: (_) => SearchViewModel(),
        builder: (context, child) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 2.0, top: 5.0, right: 2.0, bottom: 3.0),
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  TextField(
                    onChanged: (text) {
                      this.text = text;
                      context
                          .read<SearchViewModel>()
                          .searchMovie(text: text, page: 1);
                    },
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(24.0))),
                    ),
                  ),
                  const Positioned(
                      right: 20.0, height: 50.0, child: Icon(Icons.search))
                ]),
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height -
                //     50.0 -
                //     MediaQuery.of(context).padding.bottom,
                height: MediaQuery.of(context).size.height -
                    2 * 50.0 -
                    kBottomNavigationBarHeight,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  controller: context.watch<SearchViewModel>().controller,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 2 / 3),
                  scrollDirection: Axis.vertical,
                  itemCount: search == null ? 8 : search!.results!.length,
                  itemBuilder: (context, index) {
                    search = context.watch<SearchViewModel>().search;
                    return search == null
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
                                            id: search!.results![index].id!)),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      child:
                                          search!.results![index].posterPath ==
                                                  null
                                              ? Image.asset("images/bear.jpg")
                                              : Image.network(
                                                  "https://image.tmdb.org/t/p/w200/${search!.results![index].posterPath!}",
                                                  fit: BoxFit.fitHeight,
                                                ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
