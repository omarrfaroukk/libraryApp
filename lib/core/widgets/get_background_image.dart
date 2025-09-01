import 'package:flutter/material.dart';

class GetBackgroundImage extends StatelessWidget {
  final Widget w;
  const GetBackgroundImage({super.key, required this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image.png"), fit: BoxFit.cover)),
      child: w,
    );
  }
}