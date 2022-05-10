import 'package:flutter/material.dart';

import 'package:todo_movie/src/model/listplaying/listfilmonplay.dart';
import 'package:todo_movie/src/network/networkapi.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody>
    with TickerProviderStateMixin {
  final String uriimg = 'https://image.tmdb.org/t/p/w300';
  final String url =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=d79d9f8467a0e6d7b24624c522cb2ab3';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _body(),
      ),
    );
  }

  late Future<ListFilmOnPlaying> listFilmOnPlaying;

  late TabController _tabController;
  @override
  initState() {
    super.initState();
    listFilmOnPlaying = NetworkAPI(url).featchData();
    _tabController = TabController(length: 4, vsync: this);
  }

  List<String> title = ['Top Lists', 'Gen\'es', 'In Theaters', 'Upcoming'];
  Widget _body() {
    return Stack(
      children: [
        Container(
          child: _gridviewAPI(),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: const Color(0xff525464),
            child: TabBar(
                controller: _tabController,
                labelColor: const Color.fromARGB(0, 0, 0, 0),
                tabs: <Widget>[
                  Tab(
                    child: Text(title[0]),
                  ),
                  Tab(
                    child: Text(title[1]),
                  ),
                  Tab(
                    child: Text(title[2]),
                  ),
                  Tab(
                    child: Text(title[3]),
                  ),
                ]),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _bottomMenu(),
        ),
      ],
    );
  }

  FutureBuilder<ListFilmOnPlaying> _gridviewAPI() {
    return FutureBuilder<ListFilmOnPlaying>(
      future: listFilmOnPlaying,
      builder: (context, snapshot) {
        // ignore: unnecessary_null_comparison
        if (snapshot != null) {
          return _gridviewBuiderItem(snapshot);
        } else {
          return const Center(
            child: Text('khong load du lieu'),
          );
        }
      },
    );
  }

  GridView _gridviewBuiderItem(AsyncSnapshot<ListFilmOnPlaying> snapshot) {
    return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0.5,
            mainAxisSpacing: 2.5,
            childAspectRatio: 3 / 4,
          ),
          itemCount: snapshot.data?.result.length,
          itemBuilder: (_, index) {
            return SizedBox(
              child: Center(
                child: Image.network(
                    uriimg + '${snapshot.data?.result[index].srcPoster}'),
              ),
            );
          },
        );
  }

  Container _bottomMenu() {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
      color: const Color(0xff525464),
      height: 70.0,
      child: _bottomItemMenu(),
    );
  }

  Row _bottomItemMenu() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: const [
              Expanded(
                child: Icon(Icons.star),
              ),
              Expanded(child: Text('dads')),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: const [
              Expanded(
                child: Icon(Icons.star),
              ),
              Expanded(child: Text('dads')),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: const [
              Expanded(
                child: Icon(Icons.star),
              ),
              Expanded(child: Text('dads')),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: const [
              Expanded(
                child: Icon(Icons.star),
              ),
              Expanded(child: Text('dads')),
            ],
          ),
        ),
      ],
    );
  }
}
