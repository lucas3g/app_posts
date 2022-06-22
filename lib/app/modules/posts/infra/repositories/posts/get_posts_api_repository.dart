import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/posts_entity.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_exception.dart';
import 'package:app_posts/app/modules/posts/domain/repositories/posts/get_posts_api_repository_interface.dart';
import 'package:app_posts/app/modules/posts/external/datasources/posts/get_posts_api_datasource.dart';

class GetPostsAPIRepository implements IGetPostsAPIRepository {
  final GetPostsAPIDataSource getPostsAPIDataSource;

  GetPostsAPIRepository({
    required this.getPostsAPIDataSource,
  });

  @override
  Future<Either<IPostsException, List<PostsEntity>>> call() async {
    return await getPostsAPIDataSource();
  }
}
