import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtaskomisoft/data/api_result.dart';
import 'package:testtaskomisoft/data/user_repository.dart';

import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  UserRepository userRepository;

  SignInBloc(this.userRepository) : super(SignInInitialState());

  RegExp _emailValidator = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInButtonPressedEvent) {
      if (event.email.isEmpty) {
        yield SignInFailureState(validationError: ValidationError.EmptyEmail);
      } else if (event.password.isEmpty) {
        yield SignInFailureState(
            validationError: ValidationError.EmptyPassword);
      } else if (!_emailValidator.hasMatch(event.email)) {
        yield SignInFailureState(validationError: ValidationError.InvalidEmail);
      } else {
        yield SignInLoadingState();
        yield await _signIn(event.email, event.password);
      }
    }
    if (event is RetryEvent) {
      yield SignInLoadingState();
      yield await _signIn(event.email, event.password);
    }
  }

  Future<SignInState> _signIn(String email, String password) async {
    var res = await userRepository.signInViaEmailPassword(email, password);
    if (res.error == ApiError.NONE) {
      await userRepository.saveToken(res.data!);
      return SignInSuccessState();
    } else
      return SignInFailureState(apiError: res.error);
  }
}
