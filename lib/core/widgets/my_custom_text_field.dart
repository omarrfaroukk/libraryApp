import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  final String txtt;
  final bool obs;
  final TextInputType kt;
  final TextEditingController tec;
  final IconData myicon;
  const MyCustomTextField({super.key,required this.txtt,required this.obs,required this.kt,required this.tec,required this.myicon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                txtt,
                style: const TextStyle(
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty || value.length < 3) {
                  return "Please enter valid data";
                } else {
                  return null;
                }
              },
              controller: tec,
              keyboardType: kt,
              obscureText: obs,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                suffixIcon: (txtt == "Password" || txtt == "Confirm Password")
                    ? IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {},
                      )
                    : null,
                icon: Icon(myicon),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        const BorderSide(color: Color(0xFF5ABD8C), width: 2)),
              )),
        )
      ],
    );
  }
}
