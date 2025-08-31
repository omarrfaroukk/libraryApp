class LoginState {
  List<String> usernames = [];
  List <String> passwords = [];
  LoginState(this.usernames, this.passwords);
}

class LoginInitial extends LoginState {
  LoginInitial() : super([], []);
}

class LoginSuccess extends LoginState {
  LoginSuccess(super.usernames, super.passwords);
}

class LoginFailed extends LoginState {
  LoginFailed(super.usernames, super.passwords);

}
