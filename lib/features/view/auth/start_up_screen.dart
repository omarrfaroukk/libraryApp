import 'package:flutter/material.dart';
import 'package:library_app/features/view/auth/choose_join.dart';
//import 'package:library_app/startups/login_screen.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5ABD8C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("booky",style: TextStyle(
              fontSize: 93,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.italic,
              color: Colors.white,
              ),),
            const SizedBox(height:70),
            Image.asset("assets/read.png",height: 298,width: 202,),
            const SizedBox(height:30),
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => const ChooseJoin(),)
                );
            }, icon:const Icon(Icons.arrow_forward_rounded))
          ],
      ),),
    );
  }
}