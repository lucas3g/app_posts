import 'dart:convert';

import 'package:app_posts/app/core_module/services/client_http/client_http_interface.dart';
import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/posts_entity.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_exception.dart';
import 'package:app_posts/app/modules/posts/external/adapters/posts_dto.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/posts/get_posts_api_datasource_interface.dart';

class GetPostsAPIDataSource implements IGetPostsAPIDataSource {
  final IClientHttp _clientHttpInterface;

  GetPostsAPIDataSource({
    required IClientHttp clientHttpInterface,
  }) : _clientHttpInterface = clientHttpInterface;

  @override
  Future<Either<IPostsException, List<PostsEntity>>> call() async {
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

    final List<PostsEntity> listPosts = [];

    for (var post in jsonDecode(response.data)) {
      listPosts.add(PostsDto.fromMap(post));
    }

    return right(listPosts);
  }
}
