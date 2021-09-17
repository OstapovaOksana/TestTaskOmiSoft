abstract class SignInEvent {}

class SignInButtonPressedEvent extends SignInEvent {
  String email, password;

  SignInButtonPressedEvent({required this.email, required this.password});
}

class RetryEvent extends SignInEvent {
  String email, password;

  RetryEvent({required this.email, required this.password});
}
