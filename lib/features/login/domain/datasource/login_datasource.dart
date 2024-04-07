part of features.login.domain;

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
