import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    required dynamic quiry,
  }) async {
    return await dio.get(
      url,
      queryParameters: quiry,
    );
  }
}
