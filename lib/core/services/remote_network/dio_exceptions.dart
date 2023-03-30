import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          message = "No Internet Connection";
          break;

        }
        message = "Unexpected error occurred";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode as int, dioError.response?.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? message;

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error["message"];
      case 401:
        return error;
      case 403:
        return error["message"];
      case 404:
        return error["message"];
      case 409:
        return error["message"];
      case 422:
        return error["message"];
      case 500:
        return error["message"];
      case 502:
        return error["message"];
      default:
        return 'Oops something went wrong';
    }
  }

  //
  @override
  toString() => message!;
}
