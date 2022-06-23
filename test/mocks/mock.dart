import 'package:app_posts/app/core_module/services/client_http/client_http_interface.dart';
import 'package:app_posts/app/core_module/services/client_http/dio_client_http.dart';
import 'package:app_posts/app/modules/posts/domain/repositories/posts_repository_interface.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/posts/posts_datasource_interface.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/users/users_datasource_interface.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:mocktail/mocktail.dart';

class PostsRepositoryMock extends Mock implements IPostsRepository {}

class PostsDataSourceMock extends Mock implements IPostsDataSource {}

class UsersDataSourceMock extends Mock implements IUsersDataSource {}

class ClientHttpmock extends Mock implements IClientHttp {}

class DioMock extends Mock implements DioForNative {}

class BaseResponseMock extends Mock implements BaseResponse {}

class ResponseMock extends Mock implements Response {}

class DioInterceptorMock extends Mock implements DioInterceptor {}

class DioErrorMock extends Mock implements DioError {}

class RequestOptionsMock extends Mock implements RequestOptions {}
