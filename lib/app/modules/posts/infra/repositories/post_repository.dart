import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/post_entity.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_exception.dart';
import 'package:app_posts/app/modules/posts/domain/repositories/post_repository_interface.dart';
import 'package:app_posts/app/modules/posts/infra/adapters/post_adapter.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/posts/posts_api_datasource_interface.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/users/users_api_datasource_interface.dart';

class PostRepository implements IPostRepository {
  final IPostsAPIDataSource postsAPIDataSource;
  final IUsersAPIDataSource usersAPIDataSource;

  PostRepository({
    required this.postsAPIDataSource,
    required this.usersAPIDataSource,
  });

  @override
  Future<Either<IPostsException, List<PostEntity>>> getPostsAPI() async {
    try {
      final resultUsers = await usersAPIDataSource.getUsersAPI();
      final resultPosts = await postsAPIDataSource.getPostsAPI();

      for (var user in resultUsers) {
        for (var post in resultPosts.where((e) => e['userId'] == user['id'])) {
          post['user'] = user;
        }
      }

      late List<PostEntity> result =
          resultPosts.map(PostAdapter.fromMap).toList();

      return right(result);
    } on PostsException catch (e) {
      return left(e);
    }
  }
}
