import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/posts_value_object.dart';
import 'package:app_posts/app/modules/posts/domain/usecases/posts/get_posts_api_usecase.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/posts/posts_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mocks/mocks.dart';

void main() {
  late PostsAPIRepository postsAPIRepository;
  late GetPostsAPIUseCase getPostsAPIUseCase;

  setUp(() {
    postsAPIRepository = PostsAPIRepositoryMock();
    getPostsAPIUseCase =
        GetPostsAPIUseCase(postsAPIRepository: postsAPIRepository);
  });

  test('should return a list of PostsEntity if status code is 200', () async {
    //arrege
    final List<PostsValueObject> listPosts = [
      PostsValueObject(userId: 1, id: 1, title: 'title', body: 'body')
    ];

    when(() => postsAPIRepository.getPostsAPI()).thenAnswer(
      (_) async => right(listPosts),
    );

    //Act
    final result = await getPostsAPIUseCase();

    //Expect
    expect(result.fold((l) => l, (r) => r), isA<List<PostsValueObject>>());
  });
}
