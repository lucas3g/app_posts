import '../../../domain/value_object/user_value_object.dart';
import '../../../domain/exception/user_exception.dart';

import '../../../../../core_module/types/either.dart';

abstract class IUsersAPIDataSource {
  Future<Either<IUserException, List<UserValueObject>>> getUsersAPI();
}
