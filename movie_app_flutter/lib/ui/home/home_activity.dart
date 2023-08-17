import 'package:flutter/material.dart';
import 'package:movie_app_flutter/ui/home/fragment/favorite_fragment.dart';
import 'package:movie_app_flutter/ui/home/fragment/genre_fragment.dart';
import 'package:movie_app_flutter/ui/home/fragment/search_fragment.dart';

import 'fragment/home_fragment.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int _selected = 0;
  List<Widget> fragment = [
    HomeFragment(),
    GenresFragment(),
    SearchFragment(),
    FavoriteFragment()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: fragment[_selected]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selected,
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(Icons.sensors_rounded),
              label: 'Radio',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline),
              label: 'Favorite',
              backgroundColor: Colors.purple),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }
}
