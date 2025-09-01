import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/view_model/cubit/auth_repo/auth.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState>{
  SignupCubit(): super(SignupInitial());

  Future<void>signup(String u, String p)async
  {
    emit(SignupInitial());
    if (Authentication.authedUsers.keys.contains(u)){
      emit(SignupFailed());
    }else{
      Authentication.addUser(u,p);
      await Future.delayed(const Duration(seconds: 2));
      emit(SignupSuccess());
    }
  }

}