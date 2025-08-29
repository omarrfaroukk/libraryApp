import 'package:flutter/material.dart';
import 'package:library_app/view/auth/login_screen.dart';
import 'package:library_app/view/auth/signup_screen.dart';

class ChooseJoin extends StatelessWidget {
  const ChooseJoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("booky",style: TextStyle(
              fontSize: 66,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.italic,
              color:Color(0xFF5ABD8C),
              ),),
            const SizedBox(height: 20),
            const SizedBox(
              width: 200,
              child: Text("Your book library at the office",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 25,
                color: Color(0xFF707070)
              ),),
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minWidth: 207,
              height: 50,
              color: const Color(0xFF5ABD8C),
              onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen())
                );
              } ,
              child:const Text("Log in",style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),),
          ),
          const SizedBox(height:30),
          MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color:Color(0xFF5ABD8C),
                  width: 2,
                ),
              ),
              minWidth: 207,
              height: 50,
              color: Colors.white,
              onPressed:(){
                 Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignupScreen())
                );
              } ,
              child:const Text("Sign Up",style: TextStyle(
                color: Color(0xFF5ABD8C),
                fontSize: 18
              ),),
              
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: 380,
            width: 425,
            child: Image.asset("assets/read2.png",fit: BoxFit.cover,),
          )


          ],
      ),),
    );
  }
}