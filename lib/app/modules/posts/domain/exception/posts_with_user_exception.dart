abstract class IPostsWithUserException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const IPostsWithUserException({
    required this.message,
    required this.stackTrace,
  });
}

class PostsWithUserException extends IPostsWithUserException {
  const PostsWithUserException({
    required String message,
    required StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
