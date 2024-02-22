import 'package:api_mastering/cubit/app_cubit.dart';
import 'package:api_mastering/repository/my_repo.dart';
import 'package:api_mastering/web_services/web_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<AppCubit>(() => AppCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(() => WebServices(WebServices.createAndSetupDio()));
}
