import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/posts_entity.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_exception.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/posts/get_posts_api_repository.dart';

abstract class IGetPostsAPIUseCase {
  Future<Either<IPostsException, List<PostsEntity>>> call();
}

class GetPostsAPIUseCase implements IGetPostsAPIUseCase {
  final GetPostsAPIRepository getPostsAPIRepository;

  GetPostsAPIUseCase({
    required this.getPostsAPIRepository,
  });

  @override
  Future<Either<IPostsException, List<PostsEntity>>> call() async {
    return await getPostsAPIRepository();
  }
}
