import 'package:dio/dio.dart';

class NetworkErrorHandler {
  static String handleError(DioErrorType type) {
    switch (type) {
      case DioErrorType.CANCEL:
        return 'Request is cancelled.';
      case DioErrorType.CONNECT_TIMEOUT:
        return 'Connection Timeout.';
      case DioErrorType.SEND_TIMEOUT:
        return 'Connection Send Timeout.';
      case DioErrorType.RECEIVE_TIMEOUT:
        return 'Connection Receive Timeout.';
      case DioErrorType.RESPONSE:
        return 'Server Not Responding.';
      case DioErrorType.DEFAULT:
        return 'Unexpected Error Occurred.';
      default:
        return 'Unexpected Error Occurred.';
    }
  }
}
