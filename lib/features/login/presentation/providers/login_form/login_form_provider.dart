part of feature.login.presentation.providers.login_form;

final loginRepositoryProvider =
    Provider((ref) => LoginREpositoryImpl(LoginDatasourceImpl()));

final loginProvider =
    StateNotifierProvider<LoginFormNotifier, LoginFormState>((ref) {
  final loginUserCallback = ref.watch(loginRepositoryProvider);
  return LoginFormNotifier(loginRepository: loginUserCallback);
});
