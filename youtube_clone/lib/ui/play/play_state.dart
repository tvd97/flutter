import 'package:equatable/equatable.dart';
import 'package:youtube_clone/model/entities/video.dart';

abstract class PlayState extends Equatable {
  const PlayState();

  @override
  List<Object?> get props => [];
}

class PlayStateEmpty extends PlayState {}

class PlayStateLoading extends PlayState {
  final bool first;
  final List<Video> old;

  const PlayStateLoading({required this.first, this.old = const []});

  @override
  List<Object?> get props => [first];
}

class PlayStateLoadingFinished extends PlayState {
  late List<Video> videos = [];
  final String nextToken;
  final String relativeId;

  PlayStateLoadingFinished(this.videos, this.nextToken, this.relativeId);
  @override
  List<Object?> get props => [videos,nextToken,relativeId];
  PlayStateLoadingFinished copy(List<Video>? videos, String? nextToken, String? relativeId)
  {
    return PlayStateLoadingFinished(videos??this.videos, nextToken??this.nextToken, relativeId??this.relativeId);
  }
}
