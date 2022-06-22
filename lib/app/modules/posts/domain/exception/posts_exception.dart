abstract class IPostsException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const IPostsException({
    required this.message,
    required this.stackTrace,
  });
}

class PostsException extends IPostsException {
  const PostsException({
    required String message,
    required StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
