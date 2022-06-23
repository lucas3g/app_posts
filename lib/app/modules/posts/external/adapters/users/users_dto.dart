import 'package:app_posts/app/modules/posts/domain/value_object/user_value_object.dart';

class UsersDto {
  static UserValueObject fromMap(Map<String, dynamic> map) {
    return UserValueObject(
      id: map['id'],
      avatarUrl: map['avatar']['medium'],
      name: map['name'],
    );
  }
}
