class LoginState {}

class LoginInitial extends LoginState {
  LoginInitial() : super();
}

class LoginSuccess extends LoginState {
  LoginSuccess();
}

class LoginLoading extends LoginState {
  LoginLoading();
}

class LoginFailed extends LoginState {
  LoginFailed();
}
