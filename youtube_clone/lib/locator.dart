import 'package:get_it/get_it.dart';
import 'package:youtube_clone/network/retrofit_client.dart';

final getIt= GetIt.instance;
void setupLocator()
{
  getIt.registerLazySingleton(() => RetrofitClient());
}