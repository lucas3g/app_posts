import 'package:app_posts/app/modules/posts/domain/exception/posts_with_user_exception.dart';
import 'package:app_posts/app/modules/posts/domain/usecases/get_post_with_user_usecase.dart';
import 'package:app_posts/app/modules/posts/domain/entities/posts_with_user_entity.dart';
import 'package:mobx/mobx.dart';

import 'package:app_posts/app/modules/posts/presenter/states/posts_states.dart';

part 'posts_controller.g.dart';

class PostsController = _PostsControllerBase with _$PostsController;

abstract class _PostsControllerBase with Store {
  final GetPostsWithUserUseCase getPostsWithUserUseCase;

  _PostsControllerBase({
    required this.getPostsWithUserUseCase,
  });

  @observable
  ObservableList<PostsWithUserEntity> listPostWithUsers = ObservableList.of([]);

  @observable
  PostsStates state = PostsGetAPIInitialState();

  @action
  PostsStates emit(PostsStates state) {
    return this.state = state;
  }

  @action
  Future<void> getPostsAPI() async {
    try {
      emit(PostsGetAPILoadingState());
      final result = await getPostsWithUserUseCase();

      result.fold(
        (l) => PostsWithUserException(
          message: 'Erro ao gerar posts com os usuarios',
          stackTrace: StackTrace.current,
        ),
        (r) => emit(
          PostsGetAPISuccessState(listPostWithUsers: r),
        ),
      );
    } catch (e) {
      emit(PostsGetAPIErrorState(message: e.toString()));
    }
  }
}
