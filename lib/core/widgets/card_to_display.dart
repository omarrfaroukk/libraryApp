import 'package:flutter/material.dart';
import '../../data/models/book.dart';
import 'my_custom_container.dart';

class CardToDisplay extends StatelessWidget {
  final Book b;
  const CardToDisplay({super.key, required this.b});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 30),
            MyCustomContainer(
              b: b,
              ct: const Color(0xFF707070),
              cd: const Color(0xFF707070),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Rating: ${b.rating!}",
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Color(0xFF5ABD8C),
                )),
            const SizedBox(
              height: 20,
            ),
            Text("Genre: ${b.genre??""}",
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Color(0xFF707070),
                )),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              minWidth: 207,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color(0xFF5ABD8C),
              onPressed: () {},
              child: const Text(
                "Add to My Books",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: Text(b.description!,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xFF707070),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
