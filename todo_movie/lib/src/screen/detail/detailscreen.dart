import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_movie/src/model/filmdetail/filmdetail.dart';
import 'package:todo_movie/src/model/person/person.dart';
import 'package:todo_movie/src/network/networkapi.dart';

class DetailFilmScreen extends StatefulWidget {
  const DetailFilmScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  // ignore: no_logic_in_create_state
  State<DetailFilmScreen> createState() => _DetailFilmScreenState(id);
}

class _DetailFilmScreenState extends State<DetailFilmScreen> {
  final url = 'https://api.themoviedb.org/3/movie/';
  final apiKey =
      '?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&append_to_response=credits';
  String uri = 'https://image.tmdb.org/t/p/original';
  String uriitem = 'https://image.tmdb.org/t/p/w92';
  String urlperson = 'https://api.themoviedb.org/3/person/';
  late Future<DetailFilm> film;
  final int id;
  //late final dynamic sizeImg;
  _DetailFilmScreenState(this.id);
  @override
  void initState() {
    super.initState();
    film = NetworkAPI('$url$id$apiKey').fetchDetailFimlfromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<DetailFilm>(
          future: film,
          builder: (context, snapshot) {
            return pageBody(context, snapshot);
          },
        ),
      ),
    );
  }

  Stack pageBody(BuildContext context, AsyncSnapshot<DetailFilm> snapshot) {
    return Stack(
      children: [
        infoFilm(context, snapshot),
        Positioned(
          left: 0.0,
          top: 0.0,
          right: 0.0,
          child: AppBarCustom(snapshot: snapshot, context: context),
        ),
        // Positioned(
        //   left: 0.0,
        //   bottom: 0.0,
        //   right: 0.0,
        //   child: _botAction(),
        // )
      ],
    );
  }

  Widget infoFilm(BuildContext context, AsyncSnapshot<DetailFilm> snapshot) {
    int length = snapshot.data?.credits?.crew?.length ?? 0;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ImagePoster(uri: uri, snapshot: snapshot),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                rating(),
                OverView(uriitem: uriitem, snapshot: snapshot),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.only(top: 8.0, left: 20.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0),
                      top: BorderSide(width: 1.0),
                    ),
                  ),
                  height: 40,
                  child: Row(children: const [Text('Custom Lists')]),
                ),
                const InformaitonMovie(),
                _director(context, snapshot, length),
                casters(snapshot),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 15.0),
                  height: 40.0,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(width: 0.5),
                    ),
                  ),
                  child: const Text('ávaliable'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _director(
      BuildContext context, AsyncSnapshot<DetailFilm> snapshot, int length) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: Column(children: [
        const Text("Director"),
        Container(
          height: 40,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0),
              top: BorderSide(width: 1.0),
            ),
          ),
          child: findDiretor(context, snapshot, length),
        ),
      ]),
    );
  }

  Widget findDiretor(
      BuildContext context, AsyncSnapshot<DetailFilm> snapshot, int length) {
    for (var i = 0; i < length; i++) {
      if (snapshot.data?.credits?.crew?[i].job == 'Director') {
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: snapshot.data?.credits?.crew?[i].profilePath != null
                  ? CircleAvatar(
                      radius: 39.0,
                      backgroundImage: NetworkImage(
                          '$uriitem${snapshot.data?.credits?.crew?[i].profilePath}'),
                    )
                  : const CircleAvatar(
                      radius: 92.0,
                      child: Text('DR'),
                    ),
            ),
            Text('${snapshot.data?.credits?.cast?[i].name}'),
          ],
        );
      }
    }
    return const Text('Khong tim thay');
  }

  Widget rating() {
    return Container(
      height: 50,
      child: Column(children: [
        const Text('My Rating'),
        const Text('Rate This Movie'),
        Container(
          padding: EdgeInsets.only(
              left: 30.0, right: MediaQuery.of(context).size.width / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
            ],
          ),
        )
      ]),
    );
  }

  Widget casters([AsyncSnapshot<dynamic>? snapshot]) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: Column(children: [
        const Text("Cast"),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.5),
              top: BorderSide(width: 0.5),
            ),
          ),
          child: Column(children: [
            ...List.generate(
              4,
              (index) {
                return Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.5))),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        height: 39,
                        width: 39,
                        child: snapshot
                                    ?.data?.credits?.cast?[index].profilePath !=
                                null
                            ? CircleAvatar(
                                radius: 20.0,
                                backgroundImage: NetworkImage(
                                    '$uriitem${snapshot?.data?.credits?.cast?[index].profilePath}'))
                            : const CircleAvatar(
                                radius: 20.0,
                                child: Text('AT'),
                              ),
                      ),
                      Column(
                        children: [
                          Text('${snapshot?.data?.credits?.cast?[index].name}'),
                          Text(
                              'as ${snapshot?.data?.credits?.cast?[index].character}'),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              height: 40.0,
              // decoration: const BoxDecoration(
              //     border: Border(bottom: BorderSide(width: 0.5))),
              child: Center(
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    'Show more...',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            )
          ]),
        )
      ]),
    );
  }
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key? key,
    required this.snapshot,
    required this.context,
  }) : super(key: key);

  final AsyncSnapshot<DetailFilm> snapshot;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 64, 64, 160),
      child: Stack(
        children: [
          Center(
            child: Text(snapshot.data?.title ?? 'Loading data',
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                )),
          ),
          Positioned(
              left: 15.0,
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(0, 43, 43, 172),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(40.0),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ))
        ],
      ),
    );
  }
}

class ImagePoster extends StatelessWidget {
  const ImagePoster({
    Key? key,
    required this.uri,
    required this.snapshot,
  }) : super(key: key);

  final String uri;
  final AsyncSnapshot<DetailFilm> snapshot;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        (snapshot.connectionState == ConnectionState.done)
            ? Image.network(
                '$uri${snapshot.data?.posterPath}',
                fit: BoxFit.cover,
              )
            : const Center(
                child: Text('fail!!!!'),
              ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Container(
            height: 300.0,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}

class InformaitonMovie extends StatelessWidget {
  const InformaitonMovie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0),
          top: BorderSide(width: 1.0),
        ),
      ),
      height: 170,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0),
              ),
            ),
            height: 40,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0),
              ),
            ),
            height: 40,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0),
              ),
            ),
            height: 40,
          ),
          Container(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class OverView extends StatelessWidget {
  const OverView({
    Key? key,
    required this.uriitem,
    required this.snapshot,
  }) : super(key: key);

  final String uriitem;
  final AsyncSnapshot<DetailFilm> snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0),
          top: BorderSide(width: 1.0),
        ),
      ),
      height: 250,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ImageItem(uriitem: uriitem, snapshot: snapshot),
            ),
            Container(
              height: 140.0,
              margin: const EdgeInsets.only(top: 8.0),
              child: Text('${snapshot.data?.overview}'),
            )
          ]),
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({
    Key? key,
    required this.uriitem,
    required this.snapshot,
  }) : super(key: key);

  final String uriitem;
  final AsyncSnapshot<DetailFilm> snapshot;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(snapshot.data?.productionCompanies?.length ?? 0,
            (index) {
          return snapshot.data?.productionCompanies?[index].logoPath != null
              ? Container(
                  decoration: BoxDecoration(border: Border.all(width: 1.0)),
                  margin: const EdgeInsets.all(4.0),
                  height: 92.0,
                  width: 92.0,
                  child: Image.network(
                      '$uriitem${snapshot.data?.productionCompanies?[index].logoPath}'),
                )
              : Container(
                  decoration: BoxDecoration(border: Border.all(width: 1.0)),
                  height: 92.0,
                  margin: const EdgeInsets.all(4.0),
                  width: 92.0,
                );
        }),
      ],
    );
  }
}
