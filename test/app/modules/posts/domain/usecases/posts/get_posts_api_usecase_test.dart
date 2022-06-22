import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/posts_entity.dart';
import 'package:app_posts/app/modules/posts/domain/usecases/posts/get_posts_api_usecase.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/posts/get_posts_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mocks/mocks.dart';

void main() {
  late GetPostsAPIRepository getPostsAPIRepository;
  late GetPostsAPIUseCase getPostsAPIUseCase;

  setUp(() {
    getPostsAPIRepository = GetPostsAPIRepositoryMock();
    getPostsAPIUseCase =
        GetPostsAPIUseCase(getPostsAPIRepository: getPostsAPIRepository);
  });

  test('should return a list of PostsEntity if status code is 200', () async {
    //arrege
    final List<PostsEntity> listPosts = [
      PostsEntity(userId: 1, id: 1, title: 'title', body: 'body')
    ];

    when(() => getPostsAPIRepository()).thenAnswer(
      (_) async => right(listPosts),
    );

    //Act
    final result = await getPostsAPIUseCase();

    //Expect
    expect(result.fold((l) => l, (r) => r), isA<List<PostsEntity>>());
  });
}
