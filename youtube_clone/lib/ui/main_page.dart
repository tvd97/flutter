import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/ui/fragment/home/home_bloc.dart';
import 'package:youtube_clone/ui/fragment/home/home_event.dart';
import 'package:youtube_clone/ui/fragment/home/home_fragment.dart';
import 'package:youtube_clone/ui/fragment/library_fragment.dart';
import 'package:youtube_clone/ui/fragment/short_video_fragment.dart';
import 'package:youtube_clone/ui/fragment/subscription_fragment.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selected = 0;
  List<Widget> fragment = [
    BlocProvider(
      create: (_)=>HomeBloc()..add(LoadVideoEvent()),
        child: const HomeFragment()),
    const ShortVideo(),
    Subscription(),
    const Library()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: fragment[_selected]),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selected,
          selectedItemColor: Colors.red,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black87,
                ),
                label: 'Home',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_play,
                  color: Colors.black87,
                ),
                label: 'Shorts',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black87,
                ),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.subscriptions_outlined,
                  color: Colors.black87,
                ),
                label: 'Subscription',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_library,
                  color: Colors.black87,
                ),
                label: 'Library',
                backgroundColor: Colors.white),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }
}
