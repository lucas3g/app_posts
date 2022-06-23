import 'package:app_posts/app/modules/posts/domain/entities/posts_with_user_entity.dart';

abstract class PostsStates {}

class PostsGetAPIInitialState extends PostsGetAPISuccessState {
  PostsGetAPIInitialState() : super(listPostWithUsers: []);
}

class PostsGetAPILoadingState extends PostsStates {}

class PostsGetAPISuccessState extends PostsStates {
  final List<PostsWithUserEntity> listPostWithUsers;

  PostsGetAPISuccessState({
    required this.listPostWithUsers,
  });
}

class PostsGetAPIErrorState extends PostsStates {
  final String message;
  final StackTrace? stackTrace;

  PostsGetAPIErrorState({required this.message, this.stackTrace});
}
