import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/entities/post_entity.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/user_value_object.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/posts/posts_datasource_interface.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/users/users_datasource_interface.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/posts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late IPostsDataSource postsDataSource;
  late IUsersDataSource usersDataSource;
  late PostsRepository postsRepository;

  setUp(() {
    postsDataSource = PostsDataSourceMock();
    usersDataSource = UsersDataSourceMock();
    postsRepository = PostsRepository(
        postsDataSource: postsDataSource, usersDataSource: usersDataSource);
  });

  test('should be return list of PostsEntity', () async {
    when(() => usersDataSource.getUsersAPI())
        .thenAnswer((_) async => <UserValueObject>[]);

    when(() => postsDataSource.getPostsAPI())
        .thenAnswer((_) async => <PostEntity>[]);

    final result = await postsRepository.getPostsAPI();

    expect(result.fold(id, id), isA<List<PostEntity>>());
  });
}
