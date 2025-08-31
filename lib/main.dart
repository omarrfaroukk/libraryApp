// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/view/pages/book_details.dart';
import 'package:library_app/view/pages/home_page.dart';
import 'package:library_app/view/auth/choose_join.dart';
import 'package:library_app/view/auth/login_screen.dart';
import 'package:library_app/view/auth/start_up_screen.dart';

import 'view_model/cubit/Favorites/favorites_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Favoritecubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:StartUpScreen(),
      ),
    );
  }
}