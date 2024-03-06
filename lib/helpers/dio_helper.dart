  import 'package:dio/dio.dart';

Dio createAndSetupDio() {
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