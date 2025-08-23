import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/apiconstant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        request: true,
        error: true,
      ),
    );
  }

  static Future<Response<dynamic>> postData(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    final response = await dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: {'Authorization': "Bearer $token"}),
    );
    return response;
  }

  static Future<Response<dynamic>> getData(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    final response = await dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: Options(headers: {'Authorization': "Bearer $token"}),
    );
    return response;
  }
}
