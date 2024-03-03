import 'dart:convert';
import 'package:dio/dio.dart';
import '../di/injector.dart';
import '../exceptions/api_exception.dart';
import '../utils/helper_methods.dart';

class ClientCreator {
  final Interceptor? interceptor;

  ClientCreator({this.interceptor});

  Dio create() {
    final dio2 = Dio(); // Provide a dio instance
    // dio2.options.connectTimeout(Duration(seconds: 60).inMilliseconds));
    dio2.interceptors.add(LogInterceptor(responseBody: true));
    if (interceptor != null) {
      dio2.interceptors.add(interceptor!);
    }
    return dio2;
  }
}

class HeaderInterceptor extends Interceptor {
  final kApiKey= "x-api-key";
  final keyAuthorization = "token";
  final keyLanguage = "Accept-Language";
  final keyCountry = "Connection";
  final keyType = "Content-Type";
  final keyAccept = "Accept";

  final String accessToken;

  HeaderInterceptor({required this.accessToken});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await HelperMethods.getToken();
    print('token => $token');
    // options.headers[kApiKey] = "cmN5HsL5i2dlL0BgeLPZlEhzKYS9bO05HprxHeGIcGAco7/rpzcU27bdpPC90Dvb4z4tlDAzRY5+ZUxwwGW4EA==";
    options.headers[keyAuthorization] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZDhkZjNlMjhlZDVlMDU3OTg0NDJjZiIsImlzQWRtaW4iOnRydWUsImlzQ2hlZiI6ZmFsc2UsImlhdCI6MTcwOTQ4ODM1MCwiZXhwIjoxNzM1NDA4MzUwfQ.92Ifs03MN3uY-5m-zAmlebt2cBgXMDfoMtCaWJ28M8s';
    // options.headers['Content-Type'] = 'application/json';
    // options.headers[keyAccept] = 'application/json';
    // options.headers[keyLanguage] = injector<ServicesLocator>().languageCode;
    // options.headers[keyCountry] = 'keep-alive';
    // options.headers['platform'] = Platform.isAndroid ? 'Android' : 'IOS';

    print('options.headers => ${options.headers}');
    print('options.queryParameters => ${options.queryParameters}');
    print('options.data => ${options.data}');

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'DIO ERROR onError ${err.response != null} =>error message is  ${err.error}');

    if (err.response != null) {
      Map<String, dynamic> data = json.decode(err.response.toString());

      String message = data.containsKey('message') ? data['message'] : ["Error"];
      // final status = data.containsKey('status') ? data['status'] : "Error";
      String code = data.containsKey('code') ? data['code'].toString() : "401";
      /*throw DioError(
        error: message,
        response: err.response,
        type: DioErrorType.response,
        requestOptions: err.requestOptions,
      );*/
      throw ApiException(message, code);
    } else {
      super.onError(err, handler);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    // Map<String, dynamic> data = response.data;
    // final message = data.containsKey('message') ? data['message'] : "Error";
    // final status = data.containsKey('status') ? data['status'] : "Error";
    // int code = data.containsKey('code') ? response.data['code'] : 0;
    // print('onRespons ${response.toString()} => ${code != 'Ok'}');
    // if (code == 403) {
    //   throw ApiException(message, code.toString());
    // }
  }
}
