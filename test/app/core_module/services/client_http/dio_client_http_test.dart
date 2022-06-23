import 'package:app_posts/app/core_module/services/client_http/client_http_interface.dart';
import 'package:app_posts/app/core_module/services/client_http/dio_client_http.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mock.dart';

void main() {
  late Dio dio;
  late DioClientHttp dioClient;
  late DioInterceptor dioInterceptor;

  setUp(() {
    dio = DioMock();
    dioClient = DioClientHttp(dio);
    dioInterceptor = DioInterceptor();
  });

  group('DioClientHttp happy way', () {
    test(
        'Must be return url, when the function'
        ' DioClintHTTP is called whit set base url', () {
      //Arrange
      when(() => dio.options).thenReturn(BaseOptions());
      //act
      dioClient.setBaseUrl('url');
      //expecd
      expect(dio.options.baseUrl, 'url');
    });

    test(
        'Must be return Map, when the function'
        ' setHeaders is called', () {
      //Arrrege
      when(() => dio.options).thenReturn(BaseOptions());
      //act
      dioClient.setHeaders({'teste': 'test'});
      //expecd
      expect(dio.options.headers,
          {'content-type': 'application/json; charset=utf-8', 'teste': 'test'});
    });

    test('Must be return BaseResponse, when the function Get is called',
        () async {
      //Arrange
      final response = ResponseMock();
      when(() => response.data).thenReturn({});
      when(() => response.requestOptions).thenReturn(RequestOptions(path: ''));
      when(() => dio.get(any())).thenAnswer((_) async => response);
      //act
      final result = await dioClient.get('url');
      //expect
      expect(result, isA<BaseResponse>());
    });

    test('Must be return BaseResponse, when the function Post is called',
        () async {
      //Arrege
      final response = ResponseMock();
      when(() => response.requestOptions).thenReturn(RequestOptions(path: ''));
      when(() => dio.post(any(), data: {}))
          .thenAnswer((_) => Future.value(response));
      //act
      final dioClient = DioClientHttp(dio);
      final result = await dioClient.post('url', data: {});
      //expect
      expect(result, isA<BaseResponse>());
    });

    test('Must be return BaseResponse, when the function Delete is called',
        () async {
      //Arrege
      final response = ResponseMock();
      when(() => response.requestOptions).thenReturn(RequestOptions(path: ''));
      when(() => dio.delete(any())).thenAnswer(
        (_) => Future.value(response),
      );
      //act
      final result = await dioClient.delete('url');
      //expect
      expect(result, isA<BaseResponse>());
    });

    test('Must be return BaseResponse, when the function Put is called',
        () async {
      //Arrege
      final response = ResponseMock();
      when(() => response.requestOptions).thenReturn(RequestOptions(path: ''));
      when(() => dio.put(any(), data: {})).thenAnswer(
        (_) => Future.value(response),
      );
      //act
      final result = await dioClient.put('url', data: {});
      //expect
      expect(result, isA<BaseResponse>());
    });

    test('Must be return BaseResponse, when the function Upload is called',
        () async {
      //Arrege
      final response = ResponseMock();
      when(() => response.requestOptions).thenReturn(RequestOptions(path: ''));
      when(() => dio.post(any(), data: [1])).thenAnswer(
        (_) => Future.value(response),
      );
      //act
      final result = await dioClient.upload('url', data: [1]);
      //expect
      expect(result, isA<BaseResponse>());
    });

    test(
        'Must be return Interceptors, when the function addInterceptor is called',
        () async {
      //Arrege
      final dioInterceptor = DioInterceptorMock();
      when(() => dio.interceptors).thenReturn(Interceptors());
      //act
      dioClient.addInterceptor(dioInterceptor);
      //expect
      expect(dio.interceptors, isA<Interceptors>());
    });

    test(
        'Must be remove Interceptors, when the function removeInterceptor is called',
        () async {
      //Arrege
      final dioInterceptor = DioInterceptorMock();
      when(() => dio.interceptors).thenReturn(Interceptors());
      //act
      dioClient.removeInterceptor(dioInterceptor);
      //expect
      expect(dio.interceptors, isA<Interceptors>());
    });
  });

  group('DioInterceptor happy way', () {
    test('Must be return DioError, when the function onError is called',
        () async {
      //Arre
      final dioError = DioErrorMock();
      //act
      final result = await dioInterceptor.onError(dioError);
      //expect
      expect(result, isA<DioError>());
    });
    test('Must be return Statuscode 400, when the function onError is called',
        () async {
      //Arrege
      final dioError = DioErrorMock();

      when(() => dioError.response).thenReturn(
        Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      //act
      final result = await dioInterceptor.onError(dioError);
      //expect
      expect(result.response!.statusCode, 400);
    });
    test('Must be return RequestOptions, when the function onRequest is called',
        () async {
      //Arrege
      final requestOptions = RequestOptionsMock();
      //act
      final result = await dioInterceptor.onRequest(requestOptions);
      //expect
      expect(result, isA<RequestOptions>());
    });
    test('Must be return Path, when the function onRequest is called',
        () async {
      //Arrege
      final requestOptions = RequestOptionsMock();
      const path = 'http://api';
      when(() => requestOptions.path).thenAnswer((_) => path);
      //act
      final result = await dioInterceptor.onRequest(requestOptions);
      //act

      //expect
      expect(result.path, 'http://api');
    });
    test('Must be return Response, when the function onResponse is called',
        () async {
      //Arrege
      final response = ResponseMock();
      //act
      final result = await dioInterceptor.onResponse(response);
      //expect
      expect(result, isA<Response>());
    });

    test(
        'Must be return Response status code 200 '
        ', when the function onResponse is called', () async {
      //Arrege
      final response = ResponseMock();
      when(() => response.statusCode).thenReturn(200);
      //act
      final result = await dioInterceptor.onResponse(response);
      //expect
      expect(result.statusCode, 200);
    });
  });
}
