import 'package:dio/dio.dart';

class DioClient {
  static final Dio instance = Dio(
    BaseOptions(
      contentType: 'application/json',
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  )..interceptors.add(LogInterceptor());
}
