import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/post_entity.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_exception.dart';
import 'package:app_posts/app/modules/posts/domain/repositories/posts_repository_interface.dart';

abstract class IGetPostsUseCase {
  Future<Either<IPostsException, List<PostEntity>>> call();
}

class GetPostsUseCase implements IGetPostsUseCase {
  final IPostsRepository postsRepository;

  GetPostsUseCase({
    required this.postsRepository,
  });

  @override
  Future<Either<IPostsException, List<PostEntity>>> call() async {
    return await postsRepository.getPostsAPI();
  }
}
