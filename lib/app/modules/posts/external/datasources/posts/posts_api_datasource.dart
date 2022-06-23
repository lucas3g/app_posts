import 'package:app_posts/app/core_module/services/client_http/client_http_interface.dart';
import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/posts_value_object.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_exception.dart';
import 'package:app_posts/app/modules/posts/external/adapters/posts/posts_dto.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/posts/posts_api_datasource_interface.dart';

class PostsAPIDataSource implements IPostsAPIDataSource {
  final IClientHttp _clientHttpInterface;

  PostsAPIDataSource({
    required IClientHttp clientHttpInterface,
  }) : _clientHttpInterface = clientHttpInterface;

  @override
  Future<Either<IPostsException, List<PostsValueObject>>> getPostsAPI() async {
    final response = await _clientHttpInterface.get(
      '/posts',
    );

    if (response.statusCode != 200) {
      return left(
        PostsException(
          message: response.statusCode.toString(),
          stackTrace: StackTrace.empty,
        ),
      );
    }

    final List<PostsValueObject> listPosts = [];

    for (var post in response.data) {
      listPosts.add(PostsDto.fromMap(post));
    }

    return right(listPosts);
  }
}
