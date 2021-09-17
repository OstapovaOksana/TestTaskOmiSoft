import 'package:testtaskomisoft/data/api_result.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInFailureState extends SignInState {
  ApiError apiError;
  ValidationError validationError;

  SignInFailureState(
      {this.apiError = ApiError.NONE,
      this.validationError = ValidationError.NONE});
}

enum ValidationError {
  NONE,
  EmptyEmail,
  EmptyPassword,
  InvalidEmail
}
