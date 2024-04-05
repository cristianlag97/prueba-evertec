import '../domain.dart';

class AuthResult {
  final bool success;
  final User? user;
  final String errorMessage;

  AuthResult({
    required this.success,
    this.user,
    this.errorMessage = '',
  });
}
