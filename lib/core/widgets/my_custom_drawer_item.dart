import 'package:flutter/material.dart';

class MyCustomDrawerItem extends StatelessWidget {
  final IconData icon;
  final String txt;
  const MyCustomDrawerItem({super.key, required this.icon, required this.txt});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Icon(
              icon,
              color: const Color(0xFF707070),
            ),
            const SizedBox(width: 10),
            Text(
              txt,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color(0xFF707070),
              ),
            ),
          ],
        ),
      ),
    );
  }
}