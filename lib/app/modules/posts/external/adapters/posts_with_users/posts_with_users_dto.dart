import 'package:app_posts/app/modules/posts/domain/value_object/posts_value_object.dart';
import 'package:app_posts/app/modules/posts/domain/entities/posts_with_user_entity.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/user_value_object.dart';

class PostsWithUsersDto {
  static PostsWithUserEntity fromMap(
      UserValueObject userValueObject, PostsValueObject postsValueObject) {
    return PostsWithUserEntity(
        userValueObject: userValueObject, postsValueObject: postsValueObject);
  }
}
