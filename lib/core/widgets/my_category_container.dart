import 'package:flutter/material.dart';

class MyCategoryContainer extends StatelessWidget {
  final String ast;
  final String txt ;
  const MyCategoryContainer({super.key, required this.ast, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(ast), fit: BoxFit.cover)),
      child: Center(
        child: Text(
          txt,
          style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Colors.white),
        ),
      ),
    );
  }
}