import 'dart:io';

import 'package:dio/dio.dart';

class APIProvider{

  int _connectionTimeout;
  String _contentType;
  ResponseType _responseType;
  Dio _dio;

   APIProvider([this._connectionTimeout,this._contentType,this._responseType]){
    _dio = new Dio();
    _dio.options = BaseOptions(
      baseUrl: 'https://my.api.mockaroo.com',
      connectTimeout: (this._connectionTimeout!=0)?_connectionTimeout:10000,
      responseType: this?._responseType??ResponseType.json,
      contentType: this?._contentType??ContentType.json.toString()
    );    
    _dio.interceptors.add(LogInterceptor());
  }

  Dio get getDio{
    return _dio;
  }
}