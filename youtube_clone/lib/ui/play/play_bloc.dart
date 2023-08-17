import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/locator.dart';
import 'package:youtube_clone/network/retrofit_client.dart';
import 'package:youtube_clone/ui/play/play_event.dart';
import 'package:youtube_clone/ui/play/play_state.dart';

class PlayBloc extends Bloc<PlayEvent, PlayState> {
  final service = getIt<RetrofitClient>().service;

  PlayBloc() : super(PlayStateEmpty()) {
    on<PlayLoadVideoEvent>(_onLoad);
  }

  void _onLoad(PlayLoadVideoEvent event, Emitter<PlayState> emitter) async {
    final e = event;
    emitter(const PlayStateLoading(first: true));
    try {
      final response = await service.getRelativeVideos({
        'relatedToVideoId': e.id,
        'part': ['snippet'],
        'type': 'video'
      });
      emitter(PlayStateLoadingFinished(
          response.items!, response.nextPageToken ?? "", e.id));
    } on DioError catch (e) {
      debugPrint(e.message);
    }
  }
}
