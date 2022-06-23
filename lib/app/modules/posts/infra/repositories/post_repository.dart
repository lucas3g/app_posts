import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/post_entity.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_exception.dart';
import 'package:app_posts/app/modules/posts/domain/repositories/posts_repository_interface.dart';
import 'package:app_posts/app/modules/posts/infra/adapters/post_adapter.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/posts/posts_datasource_interface.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/users/users_datasource_interface.dart';

class PostsRepository implements IPostsRepository {
  final IPostsDataSource postsDataSource;
  final IUsersDataSource usersDataSource;

  PostsRepository({
    required this.postsDataSource,
    required this.usersDataSource,
  });

  @override
  Future<Either<IPostsException, List<PostEntity>>> getPostsAPI() async {
    try {
      final resultUsers = await usersDataSource.getUsersAPI();
      final resultPosts = await postsDataSource.getPostsAPI();

      for (var user in resultUsers) {
        for (var post in resultPosts.where((e) => e['userId'] == user['id'])) {
          post['user'] = user;
        }
      }

      late List<PostEntity> result =
          resultPosts.map(PostAdapter.fromMap).toList();

      return right(result);
    } on IPostsException catch (e) {
      return left(e);
    }
  }
}
