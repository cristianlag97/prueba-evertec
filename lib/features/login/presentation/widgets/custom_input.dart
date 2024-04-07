part of features.login.presentation.widgets;

class CustomInput extends StatelessWidget {
  const CustomInput({
    required this.label,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isPassword = false,
    this.onActivateObscureText,
    this.initialValue,
    this.fontSize = 16,
    super.key,
  });

  final String label;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool isPassword;
  final Function()? onActivateObscureText;
  final String? initialValue;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: colorDarkGray),
      borderRadius: BorderRadius.circular(15),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('   $label'),
        TextFormField(
          initialValue: initialValue,
          onTapOutside: (PointerDownEvent event) =>
              FocusScope.of(context).unfocus(),
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: TextStyle(fontSize: fontSize, color: const Color(0xFF747688)),
          decoration: InputDecoration(
            contentPadding: padding14,
            floatingLabelStyle: TextStyle(
              color: colorDarkGray,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: colorError,
                )),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: colorError),
            ),
            isDense: true,
            labelStyle:
                TextStyle(fontSize: fontSize, color: const Color(0xFF747688)),
            errorText: errorMessage,
            focusColor: colors.primary,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText
                          ? Icons.lock_outline_rounded
                          : Icons.lock_open_sharp,
                      color: const Color(0xFF747688),
                    ),
                    onPressed: onActivateObscureText,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
