import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_movie/src/common/apivariable.dart';
import 'package:todo_movie/src/model/filmdetail/filmdetail.dart';
import 'package:todo_movie/src/model/filmdetail/imagefilm.dart';
import 'package:todo_movie/src/network/networkapi.dart';
import 'package:todo_movie/src/screen/caster/caster.dart';
import 'package:todo_movie/src/screen/common/appbarcustom.dart';
import 'package:todo_movie/src/screen/detail/custompaint.dart';
import 'package:todo_movie/src/screen/detail/overview.dart';
import 'dart:ui' as ui;

class DetailFilmScreen extends StatefulWidget {
  const DetailFilmScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  // ignore: no_logic_in_create_state
  State<DetailFilmScreen> createState() => _DetailFilmScreenState(id);
}

class _DetailFilmScreenState extends State<DetailFilmScreen> {
  final url = ApiVariable.urlfilm;
  final apiKey = ApiVariable.apikey + '&append_to_response=credits';
  String uri = ApiVariable.urlfullimage;
  String uriitem = ApiVariable.url92image;
  String urlperson = ApiVariable.urlperson;
  late Future<DetailFilm> film;
  late Future<ImageFIlm> imageFilm;
  final int id;
  //late final dynamic sizeImg;
  _DetailFilmScreenState(this.id);
  @override
  void initState() {
    super.initState();
    film = NetworkAPI().fetchDetailFimlfromAPI('$url$id$apiKey');
    imageFilm = NetworkAPI().fetchImagelFiml('$url$id/images$apiKey');
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
          child: AppBarCustom(title: snapshot.data?.title, context: context),
        ),
      ],
    );
  }

  Widget infoFilm(BuildContext context, AsyncSnapshot<DetailFilm> snapshot) {
    int length = snapshot.data?.credits?.crew?.length ?? 0;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            child: ImagePoster(uri: uri, snapshot: snapshot),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                rating(),
                OverView(uriitem: uriitem, snapshot: snapshot, imagefilm: imageFilm,),
                Container(
                  margin: const EdgeInsets.only(top: 25.0, bottom: 25.0),
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
                Column(
                  children: [
                    iteminfo(snapshot.data?.releaseDate, 'Release Day'),
                    iteminfo(snapshot.data?.runtime, 'Runtime'),
                    iteminfo(snapshot.data?.voteAverage, 'Rating'),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0),
                        ),
                      ),
                      height: 40,
                      child: Row(
                        children: [
                          const Text('Genre'),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Text(
                              '${snapshot.data?.genres?[0].name},${snapshot.data?.genres?[1].name}'),
                        ],
                      ),
                    )
                  ],
                ),
                _director(context, snapshot, length),
                casters(snapshot),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(bottom: 15.0, left: 20.0),
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

  Container iteminfo(dynamic data, String text) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
      margin: const EdgeInsets.only(bottom: 0.3),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.2),
          bottom: BorderSide(width: 0.2),
        ),
      ),
      height: 40,
      child: Row(
        children: [
          Text(text),
          const Expanded(
            child: SizedBox(),
          ),
          Text('$data')
        ],
      ),
    );
  }

  Widget _director(
      BuildContext context, AsyncSnapshot<DetailFilm> snapshot, int length) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text(
              "Director",
              style: TextStyle(),
            )),
        Container(
          height: 60,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: snapshot.data?.credits?.crew?[i].profilePath != null
                  ? CircleAvatar(
                      radius: 20.0,
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
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      height: 70.0,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(child: Text('My Rating')),
            const Expanded(child: Text('Rate This Movie')),
            Expanded(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text("Cast"),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.5),
              top: BorderSide(width: 0.5),
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ...List.generate(
              4,
              (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CasterScreen(
                            id: snapshot?.data?.credits?.cast?[index].id),
                      ),
                    );
                  },
                  child: Container(
                    height: 60.0,
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 10.0, bottom: 10.0),
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          child: buildItem(snapshot, index, 'AT'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                                    '${snapshot?.data?.credits?.cast?[index].name}')),
                            Expanded(
                              child: Text(
                                  'as ${snapshot?.data?.credits?.cast?[index].character}'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              alignment: Alignment.centerLeft,
              height: 40.0,
              // decoration: const BoxDecoration(
              //     border: Border(bottom: BorderSide(width: 0.5))),
              child: InkWell(
                onTap: () {},
                // ignore: prefer_const_constructors
                child: Text(
                  'Show more...',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            )
          ]),
        )
      ]),
    );
  }

  Widget buildItem(AsyncSnapshot<dynamic>? snapshot, int index, String text) {
    return snapshot?.data?.credits?.cast?[index].profilePath != null
        ? CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(
                '$uriitem${snapshot?.data?.credits?.cast?[index].profilePath}'))
        : CircleAvatar(
            radius: 20.0,
            child: Text(text),
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
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.width * 0.35.toDouble()),
                  painter: RPSCustomPainter(),
                ),
                Positioned(
                    left: 10.0,
                    right: 5.0,
                    bottom: 45.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${snapshot.data?.releaseDate} - ${snapshot.data?.runtime}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text('${snapshot.data?.title}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30.0)),
                      ],
                    )),
                Positioned(
                    left: 5.0,
                    right: 5.0,
                    bottom: 5.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.play_circle,
                          color: Colors.white,
                        ),
                        Icon(Icons.add, color: Colors.white),
                        Icon(Icons.upcoming_sharp, color: Colors.white),
                      ],
                    ))
              ],
            ))
      ],
    );
  }
}
