import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(BaseOptions(
      // baseUrl: "https://api.example.com",  // Change to your API base URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    ));

    // Interceptors (optional)
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add authorization token if needed
        options.headers["Authorization"] = "Bearer YOUR_TOKEN";
        if(kDebugMode) printRequest(options);
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if(kDebugMode) printResponse(response);
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        if(kDebugMode) printError(e);
        return handler.next(e);
      },
    ));
  }

  /// **GET request**
  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(path, queryParameters: queryParams);
    } catch (e) {
      rethrow;
    }
  }

  /// **POST request**
  Future<Response> post(String path, {dynamic body}) async {
    try {
      return await _dio.post(path, data: body);
    } catch (e) {
      rethrow;
    }
  }

  /// **Multipart request**
  Future<Response> uploadFile(
      String path, String filePath, String fileKey) async {
    try {
      FormData formData = FormData.fromMap({
        fileKey: await MultipartFile.fromFile(filePath),
      });

      return await _dio.post(path, data: formData);
    } catch (e) {
      rethrow;
    }
  }

  /// 🖨 **Logs Request Data**
  void printRequest(RequestOptions options) {
    print('➡️ [API Request] ${options.method} ${options.uri}');
    print('Headers: ${options.headers}');
    print('Query Parameters: ${options.queryParameters}');
    if (options.data != null) {
      print('Body: ${options.data}');
    }
  }

  /// 🖨 **Logs Response Data**
  void printResponse(Response response) {
    print('✅ [API Response] ${response.statusCode} ${response.requestOptions.uri}');
    print('Data: ${response.data}');
  }

  /// 🖨 **Logs Error Data**
  void printError(DioException e) {
    print('❌ [API Error] ${e.requestOptions.uri}');
    print('Error: ${e.message}');
    if (e.response != null) {
      print('Response Data: ${e.response?.data}');
    }
  }

}
