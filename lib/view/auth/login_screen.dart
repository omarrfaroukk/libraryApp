import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/widgets/get_background_image.dart';
import 'package:library_app/core/widgets/my_custom_text_field.dart';
import 'package:library_app/data/models/my_classes.dart';
import 'package:library_app/view/pages/home_page.dart';
import 'package:library_app/view_model/cubit/Login/login_cubit.dart';
import 'package:library_app/view_model/cubit/Login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKeyy = GlobalKey<FormState>();
  bool isValidU = false;
  bool isValidP = false;
  bool isVisible = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Logincubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else if (state is LoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
                content: Text("Username and Passwords does not match")),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
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
                    fontStyle: FontStyle.italic),
              ),
            ),
            body: GetBackgroundImage(
              w: Form(
              key: _formKeyy,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    const Text(
                      "Forgot your Password? ",
                      style: TextStyle(fontSize: 18, color: Color(0xFF707070)),
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: (isValidP && isValidU)
                              ? const Color(0xFF5ABD8C)
                              : const Color(0xFFAFDFC7),
                          width: 2,
                        ),
                      ),
                      minWidth: 207,
                      height: 50,
                      color: (isValidP && isValidU)
                          ? const Color(0xFF5ABD8C)
                          : const Color(0xFFAFDFC7),
                      onPressed: () {
                        if (_formKeyy.currentState!.validate()) {
                          BlocProvider.of<Logincubit>(context).login(
                              usernameController.text, passwordController.text);
                        }
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18),
                      ),
                    ),
                    
                  ],
                ),
              ),
            )));
      },
    );
  }
}
