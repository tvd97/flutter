import 'package:equatable/equatable.dart';
import 'package:youtube_clone/model/entities/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class AppState extends Equatable {
  Video? current;
  YoutubePlayerController? controller;

  AppState(this.current);

  @override
  // TODO: implement props
  List<Object?> get props => [current, controller];
}

class VideoByIdState extends AppState {
  VideoByIdState() : super(null);
}

class VideoPlayerState extends AppState {
  final bool isPlayer;
  final bool isLoop;
  final bool isAutoNext;
  final bool isMinimize;

  VideoPlayerState(
    Video? current,
    YoutubePlayerController? controller, {
    required this.isPlayer,
    this.isLoop = false,
    this.isAutoNext = false,
    this.isMinimize = false,
  }) : super(current);

  @override
  // TODO: implement props
  List<Object?> get props => [isPlayer, isLoop, isAutoNext, current];

  VideoPlayerState copyRight(
      {Video? video,
      YoutubePlayerController? controller,
      bool? isPlayer,
      bool? isLoop,
      bool? isAutoNext,
      bool? isMinimize}) {
    return VideoPlayerState(
        video ?? current,
        controller ?? controller,
        isPlayer: isPlayer ?? this.isPlayer,
        isLoop: isLoop ?? this.isLoop,
        isAutoNext: isAutoNext ?? this.isAutoNext,
        isMinimize: isMinimize ?? this.isMinimize);
  }
}
