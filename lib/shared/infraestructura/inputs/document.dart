part of shared.infrastructure.inputs;

enum DocumentError { empty, less, more }

class Document extends FormzInput<String, DocumentError> {
  const Document.pure() : super.pure('');
  const Document.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == DocumentError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == DocumentError.less) {
      return 'No tiene mas de dos caracter';
    }
    if (displayError == DocumentError.more) {
      return 'Pasaste el límite de carácteres';
    }

    return null;
  }

  @override
  DocumentError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return DocumentError.empty;
    }
    if (value.length <= 1) return DocumentError.less;
    if (value.length >= 20) return DocumentError.more;
    return null;
  }
}
