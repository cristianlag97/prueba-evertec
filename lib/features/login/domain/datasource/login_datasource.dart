import 'package:prueba_evertec/features/login/domain/domain.dart';

abstract class LoginDatasource {
  Future<AuthResult> loginUser({
    String document,
    String documentType,
    String password,
  });
  Future<User> registerUser({
    String document,
    String documentType,
    String password,
  });
}
