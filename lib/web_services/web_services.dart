
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/user.dart';
import '../utils/constants.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class WebServices{
  factory WebServices(Dio dio ,{String baseUrl}) = _WebServices;

@GET(USER_EP)
Future<List<User>> getAllUsers();

@GET('${USER_EP}/{id}')
Future<User> getUserById(@Path() int id);

@POST(USER_EP)
Future<User> createNewUser(@Body() User newUser, @Header('Authorization') String token);

@DELETE('${USER_EP}/{id}')
Future<dynamic> deleteUser(@Path() int id, @Header('Authorization') String token);

static  Dio createAndSetupDio() {
    Dio dio = Dio();
    dio
      ..options.connectTimeout = Duration(seconds: 10)
      ..options.receiveTimeout = Duration(seconds: 10);
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));
    return dio;
  }
}