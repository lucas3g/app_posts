import '../../../domain/value_object/posts_value_object.dart';

class PostsDto {
  static PostsValueObject fromMap(Map<String, dynamic> map) {
    return PostsValueObject(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}
