part of features.login.infraestructure;

class LoginREpositoryImpl extends LoginRepository {
  final LoginDatasource loginDatasource;

  LoginREpositoryImpl(this.loginDatasource);

  @override
  Future<AuthResult> loginUser({
    String document = '',
    String documentType = '',
    String password = '',
  }) {
    return loginDatasource.loginUser(
        document: document, documentType: documentType, password: password);
  }

  @override
  Future<User> registerUser({
    String document = '',
    String documentType = '',
    String password = '',
  }) {
    return loginDatasource.registerUser(
      document: document,
      documentType: documentType,
      password: password,
    );
  }
}
