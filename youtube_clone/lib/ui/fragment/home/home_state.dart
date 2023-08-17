import 'package:equatable/equatable.dart';
import 'package:youtube_clone/model/entities/video.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class VideoEmpty extends HomeState {}

class VideoLoading extends HomeState {
  final bool firstLoading;
  final List<Video> old;

  const VideoLoading({required this.firstLoading, this.old = const []});

  @override
  List<Object?> get props => [firstLoading];
}

class VideoLoadingFinished extends HomeState {
  final List<Video> videos;

  final String next;

  const VideoLoadingFinished(this.videos, this.next);

  @override
  List<Object?> get props => [videos, next];

  VideoLoadingFinished copy(List<Video>? v, String? n) {
    return VideoLoadingFinished(v ?? videos, n ?? next);
  }
}

class VideoLoadFail extends HomeState {
  final String e;

  const VideoLoadFail(this.e);

  @override
  List<Object?> get props => [e];
}
