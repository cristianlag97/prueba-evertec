part of features.login.presentation.widgets;

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.onChanged,
    required this.documentTypes,
    required this.label,
    this.fontSize = 16,
    this.errorMessage,
    this.initValue,
  });

  final Function(String)? onChanged;
  final List<String> documentTypes;
  final String? initValue;
  final String label;
  final double fontSize;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: colorDarkGray),
      borderRadius: BorderRadius.circular(15),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('   $label'),
        DropdownButtonFormField<String>(
          value: initValue,
          style: TextStyle(fontSize: fontSize, color: const Color(0xFF747688)),
          items: documentTypes.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            onChanged!(newValue!);
          },
          // validator: ,
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
          ),
        ),
      ],
    );
  }
}
