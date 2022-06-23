import '../../../../../core_module/types/either.dart';
import '../../../domain/value_object/posts_value_object.dart';
import '../../../domain/exception/posts_exception.dart';

abstract class IPostsAPIDataSource {
  Future<Either<IPostsException, List<PostsValueObject>>> getPostsAPI();
}
