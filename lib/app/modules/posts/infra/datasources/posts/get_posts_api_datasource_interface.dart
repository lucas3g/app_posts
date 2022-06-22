import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/posts_entity.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_exception.dart';

abstract class IGetPostsAPIDataSource {
  Future<Either<IPostsException, List<PostsEntity>>> call();
}
