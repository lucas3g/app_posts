import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/user_value_object.dart';
import 'package:app_posts/app/modules/posts/domain/usecases/users/get_users_api_usecase.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/users/users_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mocks/mocks.dart';

void main() {
  late UsersAPIRepository usersAPIRepository;
  late GetUsersAPIUseCase getUsersAPIUseCase;

  setUp(() {
    usersAPIRepository = UsersAPIRepositoryMock();
    getUsersAPIUseCase =
        GetUsersAPIUseCase(usersAPIRepository: usersAPIRepository);
  });

  test('should return a list of UserEntity if status code is 200', () async {
    //arrege
    final List<UserValueObject> listUsers = [
      UserValueObject(id: 1, avatarUrl: 'url', name: 'name')
    ];

    when(() => usersAPIRepository.getUsersAPI()).thenAnswer(
      (_) async => right(listUsers),
    );

    //Act
    final result = await getUsersAPIUseCase();

    //Expect
    expect(result.fold((l) => l, (r) => r), isA<List<UserValueObject>>());
  });
}
