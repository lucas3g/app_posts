import 'package:app_posts/app/core_module/services/client_http/client_http_interface.dart';
import 'package:app_posts/app/modules/posts/domain/exception/user_exception.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/users/users_api_datasource_interface.dart';

class UsersAPIDataSource implements IUsersAPIDataSource {
  final IClientHttp _clientHttpInterface;

  UsersAPIDataSource({
    required IClientHttp clientHttpInterface,
  }) : _clientHttpInterface = clientHttpInterface;

  @override
  Future<List<dynamic>> getUsersAPI() async {
    final response = await _clientHttpInterface.get(
      '/users',
    );

    if (response.statusCode != 200) {
      throw UserException(
        message: response.statusCode.toString(),
        stackTrace: StackTrace.empty,
      );
    }

    return response.data;
  }
}
