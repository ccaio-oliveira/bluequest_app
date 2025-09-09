import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  String? _accessToken;

  ApiClient(String baseUrl)
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (o, h) {
          print('HTTP ${o.method} ${o.uri} body=${o.data}');
          h.next(o);
        },
        onResponse: (r, h) {
          print('RES ${r.statusCode} ${r.requestOptions.uri}');
          h.next(r);
        },
        onError: (e, h) {
          print(
            'ERR ${e.response?.statusCode} ${e.requestOptions.method} ${e.requestOptions.uri} data=${e.response?.data}',
          );
          h.next(e);
        },
      ),
    );
  }

  set accessToken(String? token) => _accessToken = token;

  Future<Response<T>> post<T>(String path, {Object? data}) async {
    return _dio.post<T>(path, data: data, options: _authOpt());
  }

  Future<Response<T>> get<T>(String path) async {
    return _dio.get<T>(path, options: _authOpt());
  }

  Options _authOpt() => Options(
    headers: _accessToken != null
        ? {'Authorization': 'Bearer $_accessToken'}
        : null,
  );
}
