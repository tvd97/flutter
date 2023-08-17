import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:youtube_clone/network/retrofit_service.dart';

class RetrofitClient {
  final Dio dio = Dio();
  late RetrofitService service;

  RetrofitClient() {
    dio.interceptors.add(PrettyDioLogger(request: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.queryParameters
          .addAll({"key": "AIzaSyAhNEn2iIlDOJg7E-_2IRaOLVsuxk_T-uY"});
      return handler.next(options);
    }, onError: (error, handler) {
      return handler.next(error);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }));
    service = RetrofitService(dio);
  }
}
