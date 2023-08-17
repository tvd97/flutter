import 'package:equatable/equatable.dart';

abstract class PlayEvent extends Equatable
{
  const PlayEvent();
}
class PlayLoadVideoEvent extends PlayEvent
{
  final String id;
  const PlayLoadVideoEvent(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class LoadMoreVideoEvent extends PlayEvent
{
  const LoadMoreVideoEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}