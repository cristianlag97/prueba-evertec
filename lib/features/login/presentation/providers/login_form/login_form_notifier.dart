part of feature.login.presentation.providers.login_form;

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier({required this.loginRepository}) : super(LoginFormState());

  LoginRepository loginRepository;

  onDocumentChange(String value) {
    final newDocument = Document.dirty(value);
    state = state.copyWith(
      document: newDocument,
      isValid:
          Formz.validate([newDocument, state.password, state.documentType]),
    );
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid:
          Formz.validate([newPassword, state.document, state.documentType]),
    );
  }

  onDocumentTypeChanged(String value) {
    final newDocumentType = DocumentType.dirty(value);
    state = state.copyWith(
      documentType: newDocumentType,
      isValid:
          Formz.validate([newDocumentType, state.document, state.password]),
    );
  }

  onChangeObscureText() {
    state = state.copyWith(isObscureText: !state.isObscureText);
  }

  Future<String> onFormSubmitByLogin() async {
    _touchEveryField();

    if (!state.isValid) return '';

    state = state.copyWith(isPosting: true);
    final AuthResult result = await loginRepository.loginUser(
      document: state.document.value,
      password: state.password.value,
      documentType: state.documentType.value,
    );
    String resultMessage = '';
    if (result.errorMessage == 'Error al autenticar usuario') {
      resultMessage = 'no-user';
    } else if (result.errorMessage == 'Credenciales incorrectas') {
      resultMessage = 'error-credential';
    } else {
      resultMessage = 'has-user';
    }

    state = state.copyWith(isPosting: false, hasUser: resultMessage);
    return resultMessage;
  }

  onFormSubmitByRegister() async {
    _touchEveryField();

    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);
    await loginRepository.registerUser(
      document: state.document.value,
      password: state.password.value,
      documentType: state.documentType.value,
    );
    state = state.copyWith(isPosting: false, hasUser: 'has-user');
  }

  _touchEveryField() {
    final document = Document.dirty(state.document.value);
    final documentType = DocumentType.dirty(state.documentType.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
      isFormPosted: true,
      document: document,
      documentType: documentType,
      password: password,
      isValid: Formz.validate([document, password, documentType]),
    );
  }
}
