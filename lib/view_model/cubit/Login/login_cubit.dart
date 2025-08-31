import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class Logincubit extends Cubit<LoginState> {
  Logincubit() : super(LoginInitial());
  final List _usernames = [];
  final List _passwords = [];

  Future<void> login(String u, String p) async{
    emit(LoginInitial());
    await Future.delayed(const Duration(seconds: 2));
    if (!_usernames.contains(u)) {
      _usernames.add(u);
      _passwords.add(p);
      emit(LoginSuccess(List.from(_usernames), List.from(_passwords)));
    }else{
      emit(LoginFailed(List.from(_usernames), List.from(_passwords)));
    }
  }


}
