import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/post_entity.dart';
import 'package:app_posts/app/modules/posts/domain/repositories/post_repository_interface.dart';
import 'package:app_posts/app/modules/posts/domain/usecases/get_post_usecase.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/user_value_object.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late GetPostUseCase getPostUseCase;
  late IPostRepository postRepository;

  setUp(() {
    postRepository = GetPostsRepositoryMock();

    getPostUseCase = GetPostUseCase(postRepository: postRepository);
  });

  test('should be return list of PostEntity', () async {
    //arrege
    final List<PostEntity> listPosts = [
      PostEntity(
        userId: 1,
        id: 1,
        title: 'title',
        body: 'body',
        user: UserValueObject(id: 1, name: 'name', avatarUrl: 'url'),
      )
    ];

    when(() => postRepository.getPostsAPI())
        .thenAnswer((_) async => right(listPosts));

    //act
    final result = await getPostUseCase();

    //expect
    expect(result.fold((l) => l, (r) => r), isA<List<PostEntity>>());
  });
}
