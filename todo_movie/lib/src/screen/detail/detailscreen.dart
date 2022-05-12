import 'package:flutter/material.dart';
import 'package:todo_movie/src/model/filmdetail/filmdetail.dart';
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
  final apiKey = '?api_key=d79d9f8467a0e6d7b24624c522cb2ab3';
  String uri = 'https://image.tmdb.org/t/p/original';
  late Future<DetailFilm> film;
  final int id;
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
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: image(),
        ),
        Positioned(
          left: 0.0,
          top: 0.0,
          right: 0.0,
          child: _topBar(),
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

  Widget image() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              FutureBuilder<DetailFilm>(
                future: film,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Image.network(
                      '$uri${snapshot.data?.posterPath}',
                      fit: BoxFit.cover,
                    );
                  } else {
                    return const Center(
                      child: Text('fail!!!!'),
                    );
                  }
                },
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
          ),
        ),
      
      Container(width: MediaQuery.of(context).size.width,
      child: Column(children: [
        
      ]),
      )
      ],
    );
  }

  Widget _botAction() {
    return SizedBox(
      height: 200.0,
      child: Column(children: [
        Container(),
        Container(
          height: 40.0,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.play_arrow),
              Icon(Icons.plus_one_outlined),
              Icon(Icons.upload_rounded),
            ],
          ),
        )
      ]),
    );
  }

  Widget _topBar() {
    return Container(
      color: Color.fromARGB(0, 64, 64, 160),
      child: Stack(
        children: [
          FutureBuilder<DetailFilm>(
            future: film,
            builder: (context, snapshot) {
              return SizedBox(
                child: Center(
                  child: Text(snapshot.data?.title ?? 'Loading data',
                      style: const TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      )),
                ),
              );
            },
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
