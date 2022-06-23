import 'package:app_posts/app/modules/posts/domain/usecases/get_post_usecase.dart';
import 'package:mobx/mobx.dart';

import 'package:app_posts/app/modules/posts/presenter/states/posts_states.dart';

part 'posts_controller.g.dart';

class PostsController = _PostsControllerBase with _$PostsController;

abstract class _PostsControllerBase with Store {
  final GetPostUseCase getPostUseCase;

  _PostsControllerBase({
    required this.getPostUseCase,
  });

  @observable
  PostsStates _state = PostsGetAPIInitialState();

  @computed
  PostsStates get state => _state;

  @action
  PostsStates emit(PostsStates state) {
    return _state = state;
  }

  @action
  Future<void> getPostsAPI() async {
    emit(PostsGetAPILoadingState());
    final result = await getPostUseCase();

    final value = result.fold<PostsStates>(
      (l) => PostsGetAPIErrorState(message: l.message),
      (r) {
        r.shuffle();
        return PostsGetAPISuccessState(listPostWithUsers: r);
      },
    );
    emit(value);
  }
}
