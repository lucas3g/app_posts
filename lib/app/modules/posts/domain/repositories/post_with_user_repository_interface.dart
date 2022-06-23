import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/posts_with_user_entity.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_with_user_exception.dart';

abstract class IPostWithUserRepository {
  Future<Either<IPostsWithUserException, List<PostsWithUserEntity>>>
      getPostsWithUser();
}
