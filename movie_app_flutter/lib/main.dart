import 'package:flutter/material.dart';
import 'package:movie_app_flutter/ui/home/home_activity.dart';

void main() {
  runApp(
    const MovieApp(),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeActivity(),
    );
  }
}
