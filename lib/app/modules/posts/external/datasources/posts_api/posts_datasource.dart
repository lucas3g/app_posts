import 'package:app_posts/app/core_module/services/client_http/client_http_interface.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_exception.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/posts/posts_datasource_interface.dart';

class PostsAPIDataSource implements IPostsDataSource {
  final IClientHttp _clientHttpInterface;

  PostsAPIDataSource({
    required IClientHttp clientHttpInterface,
  }) : _clientHttpInterface = clientHttpInterface;

  @override
  Future<List<dynamic>> getPostsAPI() async {
    final response = await _clientHttpInterface.get(
      '/posts',
    );

    if (response.statusCode != 200) {
      throw PostsException(
        message: response.statusCode.toString(),
        stackTrace: StackTrace.empty,
      );
    }

    return response.data;
  }
}
