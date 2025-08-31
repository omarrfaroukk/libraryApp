import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import 'package:library_app/view_model/cubit/auth_repo/auth.dart';
class Logincubit extends Cubit<LoginState> {
  Logincubit() : super(LoginInitial());

  Future<void> login(String u, String p) async{
    emit(LoginInitial());
    await Future.delayed(const Duration(seconds: 3));
    if (Authentication.authedUsers[u]==p) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailed());
    }
  }

  }

