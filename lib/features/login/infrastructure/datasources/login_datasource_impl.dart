part of features.login.infraestructure;

class LoginDatasourceImpl extends LoginDatasource {
  @override
  Future<AuthResult> loginUser({
    String document = '',
    String documentType = '',
    String password = '',
  }) async {
    try {
      Map<String, dynamic> data = await _readUserDataFromFile();

      if (data['document'] == document &&
          data['documentType'] == documentType &&
          data['password'] == password) {
        router.pushReplacement(PAGES.home.screenPath);

        return AuthResult(
            success: true,
            user: User(
              document: document,
              documentType: documentType,
              password: password,
            ));
      }
      return AuthResult(
          success: false, errorMessage: 'Credenciales incorrectas');
    } catch (e) {
      print('Error al autenticar usuario: $e');
      return AuthResult(
          success: false, errorMessage: 'Error al autenticar usuario');
    }
  }

  @override
  Future<User> registerUser({
    String document = '',
    String documentType = '',
    String password = '',
  }) async {
    Map<String, dynamic> newUser = {
      'document': document,
      'documentType': documentType,
      'password': password,
    };

    String newUserJson = json.encode(newUser);
    File file = await PathProviderPlugin.getLocalFile();
    await file.writeAsString(newUserJson);

    router.pushReplacement(PAGES.home.screenPath);
    return User(
      document: document,
      documentType: documentType,
      password: password,
    );
  }

  Future<Map<String, dynamic>> _readUserDataFromFile() async {
    File file = await PathProviderPlugin.getLocalFile();
    String contents = await file.readAsString();
    return json.decode(contents);
  }
}
