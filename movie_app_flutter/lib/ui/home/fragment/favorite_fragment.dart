import 'package:flutter/material.dart';
import 'package:movie_app_flutter/data/favorite.dart';
import 'package:movie_app_flutter/view_model/home/favorite_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteFragment extends StatelessWidget {
  FavoriteFragment({Key? key}) : super(key: key);
  List<Favorite>? favorites;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      removeTop: true,
      child: Column(children: [
        AppBar(
          title: const Center(
            child: Text(
              "Favorite",
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
          child: ChangeNotifierProvider(
              create: (_) => FavoriteViewModel(),
              builder: (context, child) {
                favorites = context.watch<FavoriteViewModel>().favorite;
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: favorites == null ? 10 : favorites!.length,
                    itemBuilder: (context, index) {
                      return favorites == null
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              enabled: true,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xffd9f6a6),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                margin: const EdgeInsets.only(
                                    top: 2.0,
                                    bottom: 5.0,
                                    left: 1.0,
                                    right: 3.0),
                                width: MediaQuery.of(context).size.width,
                                height: 150.0,
                              ),
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xffd9f6a6),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  margin: const EdgeInsets.only(
                                      top: 2.0,
                                      bottom: 5.0,
                                      left: 5.0,
                                      right: 5.0),
                                  height: 100.0,
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w200${favorites![index].posterPath!}",
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: const [
                                    Text("Title:"),
                                    Text("Release:"),
                                    Text("Rate:"),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(favorites![index].title!),
                                    Text(favorites![index].releaseDate!),
                                    Text("${favorites![index].voteAverage!}"),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                            title: Text(
                                                "Delete ${favorites![index].title!} from the favorite "),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(ctx),
                                                child: const Text("Cancle"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<FavoriteViewModel>()
                                                      .remove(favorites![index]
                                                          .id!);

                                                  Navigator.pop(ctx);
                                                },
                                                child: const Text("Ok"),
                                              )
                                            ],
                                          )),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color(0xffff0202),
                                  ),
                                ),
                              ],
                            );
                    });
              }),
        )
      ]),
    );
  }
}
