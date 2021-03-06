import 'dart:io';

import 'package:dio/dio.dart';

class APIProvider {
  int _connectionTimeout;
  int _receiveTimeout;
  int _sendTimeout;
  String _contentType;
  ResponseType _responseType;
  Dio _dio;

  APIProvider(
      [this._connectionTimeout,this._receiveTimeout,this._sendTimeout, this._contentType, this._responseType]){
    _dio = new Dio();
    _dio.options = BaseOptions(
        baseUrl: 'https://my.api.mockaroo.com',
        connectTimeout:
            (this._connectionTimeout != 0) ? _connectionTimeout : 5000,
        receiveTimeout: (this._receiveTimeout != 0) ? _receiveTimeout : 5000,
        sendTimeout: (this._sendTimeout != 0) ? _sendTimeout : 5000,
        responseType: this?._responseType ?? ResponseType.json,
        contentType: this?._contentType ?? ContentType.json.toString());
    _dio.interceptors.add(LogInterceptor());
  }

  Dio get getDio {
    return _dio;
  }
}
