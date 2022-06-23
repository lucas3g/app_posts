import 'package:app_posts/app/core_module/services/client_http/client_http_interface.dart';
import 'package:app_posts/app/core_module/types/either.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/user_value_object.dart';
import 'package:app_posts/app/modules/posts/domain/exception/user_exception.dart';
import 'package:app_posts/app/modules/posts/external/adapters/users/users_dto.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/users/users_api_datasource_interface.dart';

class UsersAPIDataSource implements IUsersAPIDataSource {
  final IClientHttp _clientHttpInterface;

  UsersAPIDataSource({
    required IClientHttp clientHttpInterface,
  }) : _clientHttpInterface = clientHttpInterface;

  @override
  Future<Either<IUserException, List<UserValueObject>>> getUsersAPI() async {
    final response = await _clientHttpInterface.get(
      '/users',
    );

    if (response.statusCode != 200) {
      return left(
        UserException(
          message: response.statusCode.toString(),
          stackTrace: StackTrace.empty,
        ),
      );
    }

    final List<UserValueObject> listUser = [];

    for (var user in response.data) {
      listUser.add(UsersDto.fromMap(user));
    }

    return right(listUser);
  }
}
