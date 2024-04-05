import 'package:prueba_evertec/features/login/domain/entities/user_entity.dart';
import 'package:prueba_evertec/features/login/infrastructure/models/user_model.dart';

class UserMapper {
  static jsonToEntity(UserModel user) => User(
        document: user.document,
        documentType: user.documentType,
        password: user.password,
      );
}
