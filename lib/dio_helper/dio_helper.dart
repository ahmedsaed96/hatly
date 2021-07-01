import 'package:dio/dio.dart';

// ignore: avoid_classes_with_only_static_members
class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData(
    String url,
    Map<String, dynamic> query,
    String? token, {
    String lang = 'ar',
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
    String url,
    Map<String, dynamic>? data, {
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    // try
    // dio!.options.headers = {
    //   'lang': lang,
    //   'Authorization': token,
    // };
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
