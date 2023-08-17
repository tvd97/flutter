import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/locator.dart';
import 'package:youtube_clone/model/entities/video.dart';
import 'package:youtube_clone/network/retrofit_client.dart';
import 'package:youtube_clone/ui/fragment/home/home_event.dart';
import 'package:youtube_clone/ui/fragment/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final service = getIt<RetrofitClient>().service;

  HomeBloc() : super(VideoEmpty()) {
    on<LoadVideoEvent>(_onLoad);
    on<LoadMoreEvent>(_onLoadMore);
    on<SearchEvent>(_onSearch);
  }

  void _onLoad(LoadVideoEvent event, Emitter<HomeState> emitter) async {
    emitter(const VideoLoading(firstLoading: true));
    try {
      final response = await service.getPopularVideos({
        "chart": "mostPopular",
        "part": ["snippet", "statistics", "player"]
      });
      if (response.items!.isEmpty) {
        emitter(VideoEmpty());
      } else {
        emitter(VideoLoadingFinished(
            response.items!!, response.nextPageToken ?? ''));
      }
    } on DioError catch (e) {
      emitter(VideoLoadFail(e.message));
    }
  }

  void _onLoadMore(LoadMoreEvent event, Emitter<HomeState> emitter) async {
    List<Video> videos = [];
    final currentState = state;
    var nextToken = "";
    if (currentState is VideoLoadingFinished) {
      videos.addAll(currentState.videos);
      nextToken = currentState.next;
    }
    emitter(VideoLoading(firstLoading: false, old: videos));
    try {
      final response = await service.getPopularVideos({
        'chart': 'mostPopular',
        'part': ['snippet', 'statistics', 'player'],
        'pageToken': nextToken
      });
      videos.addAll(response.items!);
      emitter(VideoLoadingFinished(videos, response.nextPageToken ?? ""));
    } on DioError catch (e) {
      emitter(VideoLoadFail(e.message));
    }
  }

  void _onSearch(SearchEvent event, Emitter<HomeState> emitter) async {
    emitter(const VideoLoading(firstLoading: true));
    try {
      final response = await service.searchByKeyword({
        'q': event.text,
        'part': ['snippet'],
        'type': 'video'
      });
      if (response.items!.isEmpty) {
        emitter(VideoEmpty());
      } else {
        emitter(VideoLoadingFinished(
            response.items!, response.nextPageToken ?? ""));
      }
    } on DioError catch (e) {
      emitter(VideoLoadFail(e.message));
    }
  }
}
