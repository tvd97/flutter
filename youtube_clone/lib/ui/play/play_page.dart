import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/bloc/app_bloc.dart';
import 'package:youtube_clone/bloc/app_event.dart';
import 'package:youtube_clone/bloc/app_state.dart';
import 'package:youtube_clone/model/entities/video.dart';
import 'package:youtube_clone/ui/play/play_bloc.dart';
import 'package:youtube_clone/ui/play/play_event.dart';
import 'package:youtube_clone/ui/play/play_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayPage extends StatelessWidget {
  PlayPage({Key? key}) : super(key: key);
  late Video video;

  @override
  Widget build(BuildContext context) {
    final viewBloc = BlocProvider.of<AppBloc>(context);

    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        child: BlocBuilder<AppBloc, AppState>(builder: (context, appState) {
          if (appState is VideoByIdState) {
            return const SizedBox();
          }
          if (appState is VideoPlayerState) {
            video = appState.current!;
            appState.controller = YoutubePlayerController(
              initialVideoId: video.id!,
              flags: const YoutubePlayerFlags(
                mute: false, loop: false),
            );
          }
          final bloc = BlocProvider.of<PlayBloc>(context);
          bloc.add(PlayLoadVideoEvent(video.id!));
          return Column(
            children: [
              SizedBox(child: YoutubePlayer(controller: appState.controller!,)),
              Expanded(
                  child: Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              video.snippet!.title!,
                              maxLines: 3,
                              style: const TextStyle(
                                  fontSize: 15.0, color: Colors.black87),
                            ),
                            const Text(
                              "3,627 views Premiered Jul 1,2021 #dasjaskdsdsj",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87,
                              ),
                              maxLines: 2,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.thumb_up_outlined,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "25.6K",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(Icons.thumb_down_outlined),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "65",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(Icons.share),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Share",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(Icons.download_rounded),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Download",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(Icons.library_add),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Save",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1.0,
                        color: Colors.black38,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 5.0, bottom: 5.0, left: 15.0, right: 25.0),
                        child: Row(
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.yellowAccent,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Voice of Books",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  "289K subscribe",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              "SUBSCRIBE",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1.0,
                        color: Colors.black38,
                      ),
                      BlocBuilder<PlayBloc, PlayState>(
                          builder: (context, state) {
                        List<Video> videos = [];
                        if (state is PlayStateLoading && state.first) {
                          return const SizedBox();
                        }
                        if (state is PlayStateLoading) {
                          videos = state.old;
                        }
                        if (state is PlayStateLoadingFinished) {
                          videos = state.videos;
                        }
                        return Column(children: [
                          ...List.generate(
                            videos.length,
                            (index) => Container(
                              margin: const EdgeInsets.only(bottom: 7.0),
                              height: 300,
                              child: MaterialButton(
                                onPressed: () {
                                  appState.controller!.dispose();
                                  viewBloc.add(PlayVideoEvent(video: videos[index]));
                                  bloc.add(
                                      PlayLoadVideoEvent(videos[index].id!));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 240,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(videos[index]
                                                      .snippet
                                                      ?.thumbnails
                                                      ?.medium
                                                      ?.url ??
                                                  'https://i0.wp.com/caphekhoanbetong.com/wp-content/uploads/2021/09/cac-mui-vi-cua-mot-ly-cafe-ngon-va-dat-chuan.jpg?fit=750%2C547&ssl=1'))),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              color: Colors.yellowAccent,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    videos[index]
                                                            .snippet
                                                            ?.title ??
                                                        'No title',
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                  Text(
                                                    videos[index]
                                                            .snippet
                                                            ?.channelTitle ??
                                                        '',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black87,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Icon(Icons.more_vert)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]);
                      }),
                    ],
                  ),
                ),
              ))
            ],
          );
        }),
      ),
    );
  }
}
