import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/posts_with_user_entity.dart';
import 'package:app_posts/app/modules/posts/domain/exception/posts_with_user_exception.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/post_with_user_repository.dart';

abstract class IGetPostsWithUserUseCase {
  Future<Either<IPostsWithUserException, List<PostsWithUserEntity>>> call();
}

class GetPostsWithUserUseCase implements IGetPostsWithUserUseCase {
  final PostWithUserRepository postWithUserRepository;

  GetPostsWithUserUseCase({
    required this.postWithUserRepository,
  });
  @override
  Future<Either<IPostsWithUserException, List<PostsWithUserEntity>>>
      call() async {
    return await postWithUserRepository.getPostsWithUser();
  }
}
