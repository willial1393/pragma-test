import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pragma/environments.dart';

@Injectable()
class TheCatApi {
  late Dio _dio;

  TheCatApi() {
    _dio = Dio(
      BaseOptions(
        baseUrl: environments.baseApi,
        headers: {'x-api-key': environments.apiKey},
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
    return response.data;
  }
}
