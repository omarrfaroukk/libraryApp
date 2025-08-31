import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/widgets/my_custom_text_field.dart';
import 'package:library_app/data/models/my_classes.dart';
import 'package:library_app/view_model/cubit/Signup/signup_cubit.dart';
import 'package:library_app/view_model/cubit/Signup/signup_state.dart';

import '../pages/home_page.dart';
//import 'package:library_app/view/pages/home_page.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  bool isFilled = false;
  bool isVisible = false;
  bool isVisible2 = false;

  void updateButton() {
    setState(() {
      if (usernameController.text.isNotEmpty &&
          emailController
              .text.isNotEmpty && // Corrected duplicate username check
          passwordController.text.isNotEmpty &&
          repasswordController.text.isNotEmpty) {
        isFilled = true;
      }
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
      if (state is SignupSuccess) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else if (state is SignupFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.red,
              content: Text("Username already exists")),
        );
      }
    },
    builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: const Color(0xFF5ABD8C),
          centerTitle: true,
          title: const Text(
            "Booky",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 32,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: Models.getBackgroundImage(
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCustomTextField(
                      txtt: "Email",
                      obs: false,
                      kt: TextInputType.emailAddress,
                      tec: emailController,
                      myicon: Icons.email_rounded),
                  const SizedBox(height: 20),
                  MyCustomTextField(
                      txtt: "Username",
                      obs: false,
                      kt: TextInputType.text,
                      tec: usernameController,
                      myicon: Icons.person_2_rounded),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  color: Color(0xFF5ABD8C),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 3) {
                                return "Please enter valid data";
                              } else {
                                return null;
                              }
                            },
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: isVisible,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: isVisible
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                              ),
                              icon: const Icon(Icons.password_rounded),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF5ABD8C), width: 2)),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              "Confirm Password",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  color: Color(0xFF5ABD8C),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 3) {
                                return "Please enter valid data";
                              } else {
                                return null;
                              }
                            },
                            controller: repasswordController,
                            keyboardType: TextInputType.text,
                            obscureText: isVisible2,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: isVisible2
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    isVisible2 = !isVisible2;
                                  });
                                },
                              ),
                              icon: const Icon(Icons.password_rounded),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF5ABD8C), width: 2)),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Forgot your Password? ",
                    style: TextStyle(fontSize: 18, color: Color(0xFF707070)),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isFilled
                            ? const Color(0xFF5ABD8C)
                            : const Color(0xFFAFDFC7),
                        width: 2,
                      ),
                    ),
                    minWidth: 207,
                    height: 50,
                    color: isFilled
                        ? const Color(0xFF5ABD8C)
                        : const Color(0xFFAFDFC7),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<SignupCubit>(context).signup(
                            usernameController.text, passwordController.text);
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
