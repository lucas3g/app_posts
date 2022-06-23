import 'package:app_posts/app/modules/posts/domain/value_object/posts_value_object.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/user_value_object.dart';

class PostsWithUserEntity {
  final UserValueObject userValueObject;
  final PostsValueObject postsValueObject;

  PostsWithUserEntity({
    required this.userValueObject,
    required this.postsValueObject,
  });
}
