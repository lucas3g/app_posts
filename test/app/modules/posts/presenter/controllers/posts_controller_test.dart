import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/posts_value_object.dart';
import 'package:app_posts/app/modules/posts/domain/entities/posts_with_user_entity.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/user_value_object.dart';
import 'package:app_posts/app/modules/posts/domain/usecases/posts/get_posts_api_usecase.dart';
import 'package:app_posts/app/modules/posts/domain/usecases/users/get_users_api_usecase.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/posts/posts_api_repository.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/users/users_api_repository.dart';
import 'package:app_posts/app/modules/posts/presenter/controllers/posts_controller.dart';
import 'package:app_posts/app/modules/posts/presenter/states/posts_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  late GetUsersAPIUseCase getUsersAPIUseCase;
  late GetPostsAPIUseCase getPostsAPIUseCase;
  late PostsAPIRepository getPostsAPIRepository;
  late UsersAPIRepository getUsersAPIRepository;

  late PostsController postsController;

  setUp(() {
    getUsersAPIRepository = UsersAPIRepositoryMock();
    getPostsAPIRepository = PostsAPIRepositoryMock();
    getUsersAPIUseCase =
        GetUsersAPIUseCase(usersAPIRepository: getUsersAPIRepository);
    getPostsAPIUseCase =
        GetPostsAPIUseCase(postsAPIRepository: getPostsAPIRepository);

    postsController = PostsController(
        getUsersAPIUseCase: getUsersAPIUseCase,
        getPostsAPIUseCase: getPostsAPIUseCase);
  });

  test('should return a list of PostsWithUsersEntity', () async {
    //arrege
    late List<PostsWithUserEntity> listPostsWithUsers = [];
    late List<UserValueObject> listUsers = [
      UserValueObject(id: 1, avatarUrl: 'avatarUrl', name: 'name')
    ];
    late List<PostsValueObject> listPosts = [
      PostsValueObject(userId: 1, id: 1, title: 'title', body: 'body')
    ];

    when(() => getUsersAPIRepository.getUsersAPI()).thenAnswer(
      (_) async => right(listUsers),
    );

    when(() => getPostsAPIRepository.getPostsAPI()).thenAnswer(
      (_) async => right(listPosts),
    );

    //act
    await postsController.getPostsAPI();

    if (postsController.state is PostsGetAPISuccessState) {
      listPostsWithUsers =
          (postsController.state as PostsGetAPISuccessState).listPostWithUsers;
    }

    //expect
    expect(listPostsWithUsers.isNotEmpty, true);
    expect(listPostsWithUsers, isA<List<PostsWithUserEntity>>());
  });
}
