part of features.login.infraestructure;

class UserMapper {
  static jsonToEntity(UserModel user) => User(
        document: user.document,
        documentType: user.documentType,
        password: user.password,
      );
}
