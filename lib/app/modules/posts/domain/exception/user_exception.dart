abstract class IUserException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const IUserException({
    required this.message,
    required this.stackTrace,
  });
}

class UserException extends IUserException {
  const UserException({
    required String message,
    required StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
