import 'package:flutter/material.dart';
import 'package:todo_movie/src/model/home/homebutton.dart';
import 'package:todo_movie/src/model/listplaying/filminfo.dart';
import 'package:todo_movie/src/model/listplaying/filmonplay.dart';
import 'package:todo_movie/src/network/networkapi.dart';
import 'package:todo_movie/src/screen/home/buiderapi.dart';
import 'package:todo_movie/src/screen/home/menubottombar.dart';
import 'package:todo_movie/src/screen/home/tabgrivew.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody>
    with TickerProviderStateMixin {
  final List<HomeButton> data = [
    HomeButton(data: Icons.star, text: 'Discover'),
    HomeButton(data: Icons.menu_open, text: 'My List'),
    HomeButton(data: Icons.search, text: 'Search'),
    HomeButton(data: Icons.newspaper, text: 'News'),
    HomeButton(data: Icons.settings, text: 'Settings')
  ];
  String uri = 'https://image.tmdb.org/t/p/w300';
  final String urlOnPlay =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=d79d9f8467a0e6d7b24624c522cb2ab3';

  final String urlUpcoming =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=d79d9f8467a0e6d7b24624c522cb2ab3';
  double blur = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _body(),
      ),
    );
  }

  late Future<FilmOnPlaying> filmUpComing;
  late Future<FilmOnPlaying> listFilmOnPlaying;
  late TabController _tabController;
  late List<FilmInfo> result;
  @override
  initState() {
    super.initState();
    listFilmOnPlaying = NetworkAPI(urlOnPlay).fetchFilmAPI();
    filmUpComing = NetworkAPI(urlUpcoming).fetchFilmAPI();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
  }

  List<String> title = ['Top Lists', 'Gen\'es', 'In Theaters', 'Upcoming'];
  Widget _body() {
    print(BuilderAPI().blur);
    return Stack(
      children: [
        TabBarView(controller: _tabController, children: [
          BuilderAPI(uri: uri, future: listFilmOnPlaying),
          BuilderAPI(uri: uri, future: listFilmOnPlaying),
          BuilderAPI(uri: uri, future: listFilmOnPlaying),
          BuilderAPI(uri: uri, future: filmUpComing),
        ]),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            key: const Key('tabbar'),
            height: 40.0,
            color: const Color(0xff525464),
            child: Center(
              
              child: TabGridview(tabController: _tabController, title: title,blur:BuilderAPI().blur),
            ),
          ),
        ),
        
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
              color: const Color(0xff525464),
              height: 70.0,
              child: MenuBottomBar(data: data)),
        ),
      ],
    );
  }
}
