import 'package:app_posts/app/modules/posts/domain/value_object/user_value_object.dart';

class PostEntity {
  final int userId;
  final int id;
  final String title;
  final String body;
  final UserValueObject user;

  PostEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.user,
  });
}
