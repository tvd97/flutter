import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable
{
  const HomeEvent();
}

class LoadVideoEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class LoadMoreEvent extends HomeEvent {
  const LoadMoreEvent();

  @override
  List<Object?> get props => [];
}

class SearchEvent extends HomeEvent {
  final String text;
  const SearchEvent(this.text);

  @override
  List<Object?> get props => [text];
}