import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt_service/models/address.dart';
import 'package:tt_service/services/app_config.dart';
import 'package:tt_service/models/prices.dart';

class ApiService {
  static ApiService? _instance;
  final Dio _dio = Dio();
  String? _token;


  ApiService._() {
    initializeApiService();
  }

  factory ApiService() {
    return _instance ??= ApiService._();
  }

  Future<void> initializeApiService() async {
    _dio.options.baseUrl = AppConfig.apiUrl;
    _dio.options.headers['x-api-key'] = AppConfig.apiKey;
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.validateStatus = (status) {
      return status! < 501;
    };
    _dio.interceptors.addAll([
      ErrorInterceptor(),
    ]);
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      logPrint: (obj) {
        print(obj);
      },
    ));

    _token = await getToken();
    _dio.options.headers['Authorization'] = 'Bearer $_token';
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('access_token');
    // Check if token is expired
    return token;
  }

  Future<Map?> getAuth() async {
    final String? token = await getToken();
    if (token != null) {
      try {
        Response response = await fetchData('/api/v1/user');
        if (response.statusCode == 200) {
          return {
            'address': response.data['address'],
            'creditCard': response.data['creditCard'],
            'phone': response.data['phone']
          };
        } else {
          return null;
        }
      } catch (e) {
        // ignore: avoid_print
        print('Error: $e');
      }
    } else {
      throw Exception("Unknown token");
    }
    print(token);
    return {'token': token};
    // return {'token': token as String};
  }

  Future<Response> fetchData(String endPoint) async {
    try {
      _token = await getToken();
      _dio.options.headers['Authorization'] = 'Bearer $_token';
      _dio.options.headers['x-api-key'] = AppConfig.apiKey;
      final response = await _dio.get(endPoint);
      print('fetchData вызван');
      return response;
    } catch (error) {
      if (error is DioException) {
        return Response(
            requestOptions: RequestOptions(path: endPoint),
            statusCode: 400,
            statusMessage:
                error.response?.data['detail'] ?? 'Неизвестная ошибка');
      } else {
        return Response(
            requestOptions: RequestOptions(path: endPoint),
            statusCode: 400,
            statusMessage: 'Error: $error');
      }
    }
  }

  Future<Response> postData(String endPoint, Object dataToSend) async {
    try {
      _token = await getToken();
      _dio.options.headers['x-api-key'] = AppConfig.apiKey;
      _dio.options.headers['Authorization'] = 'Bearer $_token';
      final response = await _dio.post(endPoint, data: dataToSend);
      print(response);
      return response;
    } catch (error) {
      if (error is DioException) {
        return Response(
            requestOptions: RequestOptions(path: endPoint),
            statusCode: 400,
            statusMessage:
                error.response?.data['detail'] ?? 'Неизвестная ошибка');
      } else {
        return Response(
            requestOptions: RequestOptions(path: endPoint),
            statusCode: 400,
            statusMessage: 'Error: $error');
      }
    }
  }

  Future<Response> postDataWithoutToken(
      {required String endPoint, required Object data}) async {
    try {
      final response = await _dio.post(endPoint, data: data);
      return response;
    } catch (error) {
      if (error is DioException) {
        return Response(
            requestOptions: RequestOptions(path: endPoint),
            statusCode: 400,
            statusMessage:
                error.response?.data['detail'] ?? 'Неизвестная ошибка');
      } else {
        return Response(
            requestOptions: RequestOptions(path: endPoint),
            statusCode: 400,
            statusMessage: 'Error: $error');
      }
    }
  }
  Future<BagPrices?> fetchPrices() async {
    print('fetchPrices вызван');
    try {
      _token = await getToken();
      print(_token);
      _dio.options.headers['Authorization'] = 'Bearer $_token';
      _dio.options.headers['x-api-key'] = AppConfig.apiKey;
      Response response = await fetchData('/api/v1/order/price-list');
      print('Ответ получен с кодом: ${response.statusCode}');
      if (response.statusCode == 200) {
        return BagPrices.fromJson(response.data);
      } else {
        print('Ошибка: Получен статус ${response.statusCode}');
        return null;
      }
    } catch (e, stackTrace) {
      print('Исключение в fetchPrices: $e');
      print('Стек вызовов: $stackTrace');
      return null;
    }
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 300;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}
