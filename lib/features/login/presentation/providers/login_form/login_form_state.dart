part of feature.login.presentation.providers.login_form;

class LoginFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Document document;
  final DocumentType documentType;
  final Password password;
  final bool isObscureText;
  final String hasUser;

  LoginFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.document = const Document.pure(),
    this.documentType = const DocumentType.pure(),
    this.password = const Password.pure(),
    this.isObscureText = true,
    this.hasUser = '',
  });

  LoginFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Document? document,
    DocumentType? documentType,
    Password? password,
    bool? isObscureText,
    String? hasUser,
  }) =>
      LoginFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        document: document ?? this.document,
        documentType: documentType ?? this.documentType,
        password: password ?? this.password,
        isObscureText: isObscureText ?? this.isObscureText,
        hasUser: hasUser ?? this.hasUser,
      );

  @override
  String toString() => '''LoginFormState:
  isPosting: $isPosting,
  isFormPosted: $isFormPosted,
  isValid: $isValid,
  document: $document,
  documentType: $documentType,
   password: $password,
  ''';
}
