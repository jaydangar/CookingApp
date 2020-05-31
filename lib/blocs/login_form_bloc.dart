import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LogInFormBloc extends FormBloc<String, String> {
  final userNameField =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final passwordField =
      TextFieldBloc(validators: [FieldBlocValidators.required]);

  LogInFormBloc() {
    addFieldBlocs(
      fieldBlocs: [userNameField, passwordField],
      step: 0,
    );

    userNameField.addAsyncValidators([_validateUserName]);
    passwordField.addAsyncValidators([_validatePassword]);
  }

  @override
  void onSubmitting() async {
    if (await _validatePassword(passwordField.value)==null &&
        await _validateUserName(userNameField.value)==null) {
      emitSuccess(canSubmitAgain: true, successResponse: 'successful...');
    } else {
      emitFailure(failureResponse: "Something went wrong...");
    }
  }

  Future<String> _validateUserName(String userName) async {
    if (userName != 'admin') {
      return "Invalid UserName";
    }
    return null;
  }

  Future<String> _validatePassword(String password) async {
    if (password != 'admin') {
      return "Invalid Password";
    }
    return null;
  }
}
