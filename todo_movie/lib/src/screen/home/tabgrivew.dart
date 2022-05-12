import 'package:flutter/material.dart';

class TabGridview extends StatelessWidget {
  const TabGridview({
    Key? key,
    required TabController tabController,
    required this.title, double? blur,
  }) : _tabController = tabController, super(key: key);

  final TabController _tabController;
  final List<String> title;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        isScrollable: true,
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red,
        ),
        labelColor: const Color.fromARGB(0, 0, 0, 0),
        tabs: <Widget>[
          Tab(
            child: Text(
              title[0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Tab(
            child: Text(
              title[1],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Tab(
            child: Text(
              title[2],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Tab(
            child: Text(
              title[3],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ]);
  }
}