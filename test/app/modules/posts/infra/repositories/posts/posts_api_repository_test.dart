import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/posts_value_object.dart';
import 'package:app_posts/app/modules/posts/external/datasources/posts/posts_api_datasource.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/posts/posts_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mocks/mocks.dart';

void main() {
  late PostsAPIDataSource postsAPIDataSource;
  late PostsAPIRepository postsAPIRepository;

  setUp(() {
    postsAPIDataSource = PostsAPIDataSourceMock();
    postsAPIRepository =
        PostsAPIRepository(postsAPIDataSource: postsAPIDataSource);
  });

  test('should return a list of PostsEntity if status code is 200', () async {
    //arrege
    final List<PostsValueObject> listPosts = [
      PostsValueObject(userId: 1, id: 1, title: 'title', body: 'body')
    ];

    when(() => postsAPIDataSource.getPostsAPI()).thenAnswer(
      (_) async => right(listPosts),
    );

    //Act
    final result = await postsAPIRepository.getPostsAPI();

    //Expect
    expect(result.fold((l) => l, (r) => r), isA<List<PostsValueObject>>());
  });
}
