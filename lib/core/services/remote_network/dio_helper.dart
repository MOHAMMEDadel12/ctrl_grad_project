import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../presentation/widgets/components/components.dart';
import 'dio_exceptions.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://scan-for-solution.onrender.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        }));
    if (!kReleaseMode) {
      dio!.interceptors.add;
    }
    print('dio!.options.baseUrl');
    print(dio!.options.baseUrl);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Token': 'Barear $token',
      //"lang":'ar'
    };

    print('url');
    print(url);
    print('query');
    print(query);


    return  dio!.post(
      url,
      queryParameters: query,
      data: data,
    ).catchError((e){
      final mss = DioExceptions.fromDioError(e).toString();
      showToast(message: mss.toString(), status: ToastStatus.error);
    });
  }

  static Future<Response> getData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Barear $token' ?? " ",
      //"lang":'ar'
    };
    return await dio!.get(
      url,

    ).catchError((e){
      final mss = DioExceptions.fromDioError(e).toString();
      showToast(message: mss.toString(), status: ToastStatus.error);
    });

  }

  static Future<Response> putData({
    required String url,
    String? token,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
      //"lang":'ar'
    };
    return await dio!.put(
      url,
      data: data,
      queryParameters: query,
    ).catchError((e){
      final mss = DioExceptions.fromDioError(e).toString();
      showToast(message: mss.toString(), status: ToastStatus.error);
    });
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    print('url');
    print(url);
    print('query');
    print(query);
    return dio!.delete(
      url,
      queryParameters: query,
      data: data,
    ).catchError((e){
      final mss = DioExceptions.fromDioError(e).toString();
      showToast(message: mss.toString(), status: ToastStatus.error);
    });
  }
}
