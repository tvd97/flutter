import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:youtube_clone/model/response/video_response.dart';

part 'retrofit_service.g.dart';

@RestApi(baseUrl: 'https://youtube.googleapis.com/youtube/v3/')
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String baseUrl}) = _RetrofitService;

  @GET('videos')
  Future<VideoResponse> getPopularVideos(
      @Queries() Map<String, dynamic> params);

  @GET('search')
  Future<VideoResponse> getRelativeVideos(
      @Queries() Map<String, dynamic> params);

  @GET('search')
  Future<VideoResponse> searchByKeyword(@Queries() Map<String, dynamic> params);
}
