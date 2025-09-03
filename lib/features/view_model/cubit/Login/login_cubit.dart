import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import 'package:library_app/features/view_model/cubit/auth_repo/auth.dart';

class Logincubit extends Cubit<LoginState> {
  Logincubit() : super(LoginInitial());

  Future<void> login(String u, String p) async {
    emit(LoginInitial());
    if (Authentication.authedUsers[u] == p) {
      await Future.delayed(const Duration(seconds: 2));
      emit(LoginLoading());
      emit(LoginSuccess());
    } else {
      emit(LoginFailed());
    }
  }
}
