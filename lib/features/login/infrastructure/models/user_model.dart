class UserModel {
  final String document;
  final String documentType;
  final String password;

  UserModel({
    required this.document,
    required this.documentType,
    required this.password,
  });

  UserModel.fromJson(Map<String, String> json)
      : document = json["document"] ?? '',
        documentType = json["documentType"] ?? '',
        password = json["password"] ?? '';
}
