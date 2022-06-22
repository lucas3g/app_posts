import 'package:app_posts/app/modules/posts/domain/entities/posts_entity.dart';

class PostsDto {
  static PostsEntity fromMap(Map<String, dynamic> map) {
    return PostsEntity(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}
