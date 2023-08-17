import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/bloc/app_event.dart';
import 'package:youtube_clone/bloc/app_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  YoutubePlayerController? controller;

  bool player = false;

  AppBloc() : super(VideoByIdState()) {
    on<PlayVideoEvent>(_play);
    on<PauseVideoEvent>(_pause);
    on<ResumeVideoEvent>(_resume);
    on<CloseVideoEvent>(_close);
    on<VisibleMinimizeEvent>(_visible);

  }

  void _play(PlayVideoEvent event, Emitter<AppState> emitter) {
    if(controller!=null)
      {
        controller!.reset();
      }
    controller = YoutubePlayerController(initialVideoId: event.video.id!!);
    emitter(VideoPlayerState(event.video, controller, isPlayer: true));
  }

  void _pause(PauseVideoEvent event, Emitter<AppState> emitter) {
    emitter(VideoPlayerState(state.current, controller, isPlayer: false));
  }
  void _resume(ResumeVideoEvent event, Emitter<AppState> emitter) {
    emitter(VideoPlayerState(state.current, controller, isPlayer: true,isMinimize: true));
  }
  void _close(CloseVideoEvent event, Emitter<AppState> emitter) {
    emitter(VideoByIdState());
  }
  void _visible(VisibleMinimizeEvent event, Emitter<AppState> emitter) {
    emitter(VideoPlayerState(state.current, controller, isPlayer: false,isMinimize: event.visible));
  }
  @override
  Future<void> close() {
    // todo dispose controller
    return super.close();
  }
}
