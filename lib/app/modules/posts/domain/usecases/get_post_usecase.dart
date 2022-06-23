import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/post_entity.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_exception.dart';
import 'package:app_posts/app/modules/posts/domain/repositories/post_repository_interface.dart';

abstract class IGetPostUseCase {
  Future<Either<IPostsException, List<PostEntity>>> call();
}

class GetPostUseCase implements IGetPostUseCase {
  final IPostRepository postRepository;

  GetPostUseCase({
    required this.postRepository,
  });

  @override
  Future<Either<IPostsException, List<PostEntity>>> call() async {
    return await postRepository.getPostsAPI();
  }
}
