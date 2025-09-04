// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/view/pages/book_details.dart';
import 'package:library_app/features/view/pages/home_page.dart';
import 'package:library_app/features/view/auth/choose_join.dart';
import 'package:library_app/features/view/auth/login_screen.dart';
import 'package:library_app/features/view/auth/start_up_screen.dart';
import 'package:library_app/features/view_model/cubit/Login/login_cubit.dart';
import 'package:library_app/features/view_model/cubit/Signup/signup_cubit.dart';

import 'features/api/api_service.dart';
import 'features/view_model/cubit/Favorites/favorites_cubit.dart';
import 'features/view_model/cubit/books_api/get_books_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<Favoritecubit>(create: (context) => Favoritecubit()),
        BlocProvider<Logincubit>(create: (context) => Logincubit()),
        BlocProvider<SignupCubit>(create: (context)=> SignupCubit()),
        BlocProvider<GetBooksCubit>(create: (context) => GetBooksCubit(apiService:  ApiService())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:StartUpScreen(),
      ),
    );
  }
}