import 'dart:convert';
import 'dart:io';

import 'package:prueba_evertec/core/config/config.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/domain.dart';

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
    File file = await _getLocalFile();
    await file.writeAsString(newUserJson);

    router.pushReplacement(PAGES.home.screenPath);
    return User(
      document: document,
      documentType: documentType,
      password: password,
    );
  }

  Future<File> _getLocalFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      return File('${directory.path}/credentials.json');
    } catch (e) {
      print('Error: $e');
      throw Exception();
    }
  }

  Future<Map<String, dynamic>> _readUserDataFromFile() async {
    File file = await _getLocalFile();
    String contents = await file.readAsString();
    return json.decode(contents);
  }
}
