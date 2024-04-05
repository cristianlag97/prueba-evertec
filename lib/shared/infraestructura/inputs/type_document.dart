import 'package:formz/formz.dart';

enum DocumentTypeError { empty, invalid }

class DocumentType extends FormzInput<String, DocumentTypeError> {
  const DocumentType.pure() : super.pure('');
  const DocumentType.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == DocumentTypeError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == DocumentTypeError.invalid) {
      return 'Tipo de documento inválido';
    }

    return null;
  }

  @override
  DocumentTypeError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return DocumentTypeError.empty;
    }
    if (!_isValidTipoDocumento(value)) {
      return DocumentTypeError.invalid;
    }
    return null;
  }

  bool _isValidTipoDocumento(String value) {
    final tiposValidos = [
      'tarjeta de identidad',
      'cedula',
      'pasaporte',
      'cedula de extranjeria'
    ];
    return tiposValidos.contains(value.toLowerCase());
  }
}
