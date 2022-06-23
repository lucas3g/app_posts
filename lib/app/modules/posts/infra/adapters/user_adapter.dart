import 'package:app_posts/app/modules/posts/domain/value_object/user_value_object.dart';

class UserAdapter {
  static UserValueObject fromMap(dynamic map) {
    return UserValueObject(
      id: map['id'],
      name: map['name'],
      avatarUrl: map['avatar']['medium'],
    );
  }
}
