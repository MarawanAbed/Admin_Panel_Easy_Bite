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
  final keyAuthorization = "authorization";
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
    // options.headers[keyAuthorization] = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTE1MzcxNzY5ZDZiYTYyMGMxYjI0NDM5YzJiZmI2MWExOTZiOGVkY2E4N2VlZjRmYmEyNjFjYmFhNGQzNTk2MDEzOTBlNWE5MmUwNTIwYzYiLCJpYXQiOjE3MDg4NjI2MDEuMzc3ODMxOTM1ODgyNTY4MzU5Mzc1LCJuYmYiOjE3MDg4NjI2MDEuMzc3ODM0MDgxNjQ5NzgwMjczNDM3NSwiZXhwIjoxNzQwNDg1MDAxLjM3MjU5ODg4NjQ4OTg2ODE2NDA2MjUsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.Do0QuNRXuj8RvezQmla_G558TEyH_ZqzTRXIrPo8mRMwyUyGFa8Vp9fmiaGYEWBjgzqqBXBJ9o4fYJ6-aY9ULsKknup6cZVeqSDMe0HR7M6dQPHzEwvjv-JVdhrqe_APbQk4FP6pfEsUd6Ds3odS9ktKKTGMZLp5cC_iDIspF3QANJhNusaoQIyGV7GALZoQ5xltTduB2G3m_jcGz63qWGajDy9zABclYrE_TxT8Gwfrcc_vjYoSg4dAKpTQVxw38Xs31z1SAtxJn2TOnE4xPkOgWR9iUCSFg8Qtb-AyZ1dCnn9HAIS1AV0iRKZpLT5qFHiJU7TOzFUXy0oshNdGSBCLOaQqnJkeM8v145FQ-5SNjbYLrjX9CnYDFXVErW5F6WDVLjWLt9v0pfo-8H6XX3ov1hJyH4G9G-k3KbP51PE2anDdoy9PshevbXk89nLm0Y7dsVpC8X7uNH8V_YMelbm8S7lROQH3ThB2_DqlGDcv6yG4UG8x24YfERHGY7KyBzScMZ9YOLPXLdQpkW-uKuj743Rgsk307rtjetsbA4i3VUv8MCyokPtBbktdaR_J1X2aRZU-Ga7tDuC8LmKnUgTQHuIKoON5jLh4EtcmK1j7T2NkmzrQ9EkK3qoO027cDtiNp614b-Jlf9GoG-hCyCaWiYeJs9ZQzLjeZRO8kdE';
    options.headers['Content-Type'] = 'application/json';
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
    Map<String, dynamic> data = response.data;
    final message = data.containsKey('message') ? data['message'] : "Error";
    // final status = data.containsKey('status') ? data['status'] : "Error";
    int code = data.containsKey('code') ? response.data['code'] : 0;
    print('onRespons ${response.toString()} => ${code != 'Ok'}');
    if (code == 403) {
      throw ApiException(message, code.toString());
    }
  }
}
