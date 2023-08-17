// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/movie/video/video.dart';
import 'package:movie_app_flutter/view_model/film/video_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeView extends StatelessWidget {
  YoutubeView({Key? key, required this.id, required this.title})
      : super(key: key);
  int id;
  String title;
  late YoutubePlayerController _controller;
  Video? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trailer:$title"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            context.read<VideoViewModel>().dispose();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.deepOrange,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => VideoViewModel(),
        child: Consumer<VideoViewModel>(
          builder: (context, viewModel, child) {
            viewModel.getMovieTrailerById(id: id);
            video = viewModel.video;
            if (video != null) {
              _controller = YoutubePlayerController(
                initialVideoId: viewModel.video!.results![0].key!,
                flags: const YoutubePlayerFlags(
                    autoPlay: true, mute: false, loop: false),
              );
              _controller.play();
            }
            return (video == null)
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    enabled: true,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                    ),
                  )
                : YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controller,
                    ),
                    builder: (context, player) => SizedBox(
                      child: player,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
