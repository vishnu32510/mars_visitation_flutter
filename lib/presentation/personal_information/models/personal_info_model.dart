import 'package:formz/formz.dart';

enum FormFieldError { empty }

class FormField extends FormzInput<String, FormFieldError> {
  const FormField.pure() : super.pure('');
  const FormField.dirty([super.value = '']) : super.dirty();

  @override
  FormFieldError? validator(String value) {
    if (value.isEmpty) return FormFieldError.empty;
    return null;
  }
}