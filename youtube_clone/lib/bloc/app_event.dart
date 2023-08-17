import 'package:equatable/equatable.dart';
import 'package:youtube_clone/model/entities/video.dart';

abstract class AppEvent extends Equatable
{
  const AppEvent();
  @override
  List<Object?> get props => [];
}
class PlayVideoEvent extends AppEvent{
  final Video video;
  const PlayVideoEvent({required this.video});
  @override
  List<Object?> get props => [video];
}
// pause video event
class PauseVideoEvent extends AppEvent {
  const PauseVideoEvent();
}

// pause video event
class ResumeVideoEvent extends AppEvent {
  const ResumeVideoEvent();
}

class VisibleMinimizeEvent extends AppEvent {
  final bool visible;
  const VisibleMinimizeEvent(this.visible);

  @override
  List<Object?> get props => [visible];
}
class CloseVideoEvent extends AppEvent {
  const CloseVideoEvent();
}