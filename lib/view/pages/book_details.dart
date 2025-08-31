import 'package:flutter/material.dart';
import 'package:library_app/data/models/my_classes.dart';
//import 'package:library_app/view/pages/my_books.dart';

class BookDetails extends StatefulWidget {
  final Book b;
  const BookDetails({super.key, required this.b});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
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
                fontStyle: FontStyle.italic),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image.png"), fit: BoxFit.cover)),
            child: ListView(
              children:[
                const SizedBox(height: 20,),
                Models.cardToDisplay(
                  widget.b,
                ),
            ])
            
            ));
  }
}
