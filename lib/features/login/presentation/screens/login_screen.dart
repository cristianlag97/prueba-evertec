part of features.login.presentation;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: ContainerBackground(
        color: colorWhite,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _ImageTopLogin(textStyle: textStyle),
              const _LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  void showSnackbar(BuildContext context, String messageError) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snack = customSnackbar(message: messageError);
    ScaffoldMessenger.of(context).showSnackBar(
      snack,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final loginForm = ref.watch(loginProvider);
    return Container(
      width: double.infinity,
      padding: paddingHorizontal16,
      child: Column(
        children: <Widget>[
          sizedBoxy20,
          CustomInput(
            label: 'Tipo Documento',
            fontSize: 14,
            initialValue: loginForm.documentType.value,
            onChanged: ref.read(loginProvider.notifier).onDocumentTypeChanged,
            errorMessage: loginForm.isFormPosted
                ? loginForm.documentType.errorMessage
                : null,
          ),
          sizedBoxy12,
          CustomInput(
            label: 'Número Documento',
            fontSize: 14,
            keyboardType: TextInputType.number,
            initialValue: loginForm.document.value,
            onChanged: ref.read(loginProvider.notifier).onDocumentChange,
            errorMessage:
                loginForm.isFormPosted ? loginForm.document.errorMessage : null,
          ),
          sizedBoxy12,
          CustomInput(
            label: 'Contraseña',
            isPassword: true,
            fontSize: 14,
            initialValue: loginForm.password.value,
            obscureText: loginForm.isObscureText,
            onChanged: ref.read(loginProvider.notifier).onPasswordChanged,
            onActivateObscureText:
                ref.read(loginProvider.notifier).onChangeObscureText,
            errorMessage:
                loginForm.isFormPosted ? loginForm.password.errorMessage : null,
          ),
          const SizedBox(height: 32),
          FilledButton(
            onPressed: loginForm.isPosting
                ? null
                : () => _handleButtonPress(context, loginForm, ref),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colorOrange),
            ),
            child: Container(
              padding: paddingVertical12,
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                loginForm.hasUser == 'no-user' ? 'Registrar' : 'Login',
                style: textStyle.bodyLarge!.copyWith(color: colorWhite),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => showSnackbar(context, 'Registrar usuario'),
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 5.0), // Adjust padding as needed
              child: Text(
                'Registrar Usuario',
                style: textStyle.bodyMedium!.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SocialMediaButton(
                image: 'assets/images/google.png',
                size: 0.6,
                onTap: () => showSnackbar(context, 'Google'),
              ),
              SocialMediaButton(
                image: 'assets/images/facebook.webp',
                size: 0.8,
                onTap: () => showSnackbar(context, 'Facebook'),
              ),
              SocialMediaButton(
                image: 'assets/images/instagram.png',
                size: 0.9,
                onTap: () => showSnackbar(context, 'instagram'),
              ),
            ],
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }

  void _handleButtonPress(
      BuildContext context, LoginFormState loginForm, WidgetRef ref) {
    if (loginForm.hasUser == '' ||
        loginForm.hasUser == 'has-user' ||
        loginForm.hasUser == 'error-credential') {
      _handleLogin(context, loginForm, ref);
    } else {
      _handleRegister(context, loginForm, ref);
    }
  }

  void _handleLogin(
      BuildContext context, LoginFormState loginForm, WidgetRef ref) {
    ref.read(loginProvider.notifier).onFormSubmitByLogin().then((value) {
      if (value == 'no-user') {
        showSnackbar(context, 'No hay usuario');
      } else if (value == 'error-credential') {
        showSnackbar(context, 'Las credenciales son incorrectas');
      }
    });
  }

  void _handleRegister(
      BuildContext context, LoginFormState loginForm, WidgetRef ref) {
    ref.read(loginProvider.notifier).onFormSubmitByRegister();
  }
}

class _ImageTopLogin extends StatelessWidget {
  const _ImageTopLogin({
    required this.textStyle,
  });

  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          const Image(
            image: AssetImage('assets/images/personaje-femenino-3d.webp'),
            fit: BoxFit.contain,
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: RichText(
              text: TextSpan(
                text: 'Bienvenido a:\n',
                style: textStyle.bodySmall!.copyWith(fontSize: 10),
                children: <TextSpan>[
                  TextSpan(
                    text: '   Evertec',
                    style: textStyle.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold, color: colorDarkGray2),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
