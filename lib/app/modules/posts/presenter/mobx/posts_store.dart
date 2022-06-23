import 'dart:io';

import 'package:app_posts/app/modules/posts/domain/usecases/get_posts_usecase.dart';
import 'package:mobx/mobx.dart';

import 'package:app_posts/app/modules/posts/presenter/states/posts_states.dart';

part 'posts_store.g.dart';

class PostsStore = _PostsStoreBase with _$PostsStore;

abstract class _PostsStoreBase with Store {
  final GetPostsUseCase getPostsUseCase;

  _PostsStoreBase({
    required this.getPostsUseCase,
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

    await verifyInternet();

    final result = await getPostsUseCase();

    final resultState = result.fold<PostsStates>(
      (error) => PostsGetAPIErrorState(message: error.message),
      (success) {
        success.shuffle();
        return PostsGetAPISuccessState(listPostWithUsers: success);
      },
    );
    emit(resultState);
  }

  Future<void> verifyInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (!result.isNotEmpty && !result[0].rawAddress.isNotEmpty) {
        emit(DontHaveInternetState());
        return;
      }
    } on SocketException catch (_) {
      emit(DontHaveInternetState());
      return;
    }
  }
}
