import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/posts_with_user_entity.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_with_user_exception.dart';
import 'package:app_posts/app/modules/posts/domain/repositories/post_with_user_repository_interface.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/posts_value_object.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/user_value_object.dart';
import 'package:app_posts/app/modules/posts/external/adapters/posts_with_users/posts_with_users_dto.dart';
import 'package:app_posts/app/modules/posts/external/datasources/posts/posts_api_datasource.dart';
import 'package:app_posts/app/modules/posts/external/datasources/users/users_api_datasource.dart';

class PostWithUserRepository implements IPostWithUserRepository {
  final PostsAPIDataSource postsAPIDataSource;
  final UsersAPIDataSource usersAPIDataSource;

  PostWithUserRepository({
    required this.postsAPIDataSource,
    required this.usersAPIDataSource,
  });
  @override
  Future<Either<IPostsWithUserException, List<PostsWithUserEntity>>>
      getPostsWithUser() async {
    final resultUsers = await usersAPIDataSource.getUsersAPI();
    final resultPosts = await postsAPIDataSource.getPostsAPI();

    late List<UserValueObject> users = [];
    late List<PostsValueObject> posts = [];

    resultUsers.fold((l) => l, (r) {
      users.addAll(r);
    });

    resultPosts.fold((l) => l, (r) {
      posts.addAll(r);
    });

    late List<PostsWithUserEntity> result = [];

    for (var user in users) {
      for (var post in posts.where((post) => post.userId == user.id)) {
        result.add(PostsWithUsersDto.fromMap(user, post));
      }
    }

    result.shuffle();

    return right(result);
  }
}
