import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/bloc/app_bloc.dart';
import 'package:youtube_clone/locator.dart';
import 'package:youtube_clone/ui/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const YoutubeApp());
}

class YoutubeApp extends StatelessWidget {
  const YoutubeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_)=>AppBloc(),),],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
