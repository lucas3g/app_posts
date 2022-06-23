import 'package:app_posts/app/modules/posts/domain/entities/post_entity.dart';
import 'package:app_posts/app/modules/posts/infra/adapters/user_adapter.dart';

class PostAdapter {
  static PostEntity fromMap(dynamic map) {
    return PostEntity(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
      user: UserAdapter.fromMap(
        map['user'],
      ),
    );
  }
}
