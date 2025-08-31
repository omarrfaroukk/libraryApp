class LoginState {}

class LoginInitial extends LoginState {
  LoginInitial() : super();
}

class LoginSuccess extends LoginState {
  LoginSuccess();
}

class LoginFailed extends LoginState {
  LoginFailed();
}
