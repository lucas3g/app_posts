import 'package:app_posts/app/core_module/services/client_http/client_http_interface.dart';
import 'package:app_posts/app/modules/posts/external/datasources/posts/posts_api_datasource.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/posts/posts_api_repository.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/users/users_api_repository.dart';
import 'package:mocktail/mocktail.dart';

class PostsAPIRepositoryMock extends Mock implements PostsAPIRepository {}

class PostsAPIDataSourceMock extends Mock implements PostsAPIDataSource {}

class IClientHttpMock extends Mock implements IClientHttp {}

class UsersAPIRepositoryMock extends Mock implements UsersAPIRepository {}
