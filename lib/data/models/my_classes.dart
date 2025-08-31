import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/view_model/cubit/Favorites/favorites_cubit.dart';
import 'package:library_app/view_model/cubit/Favorites/favorites_state.dart';

class MyCustomContainer extends StatefulWidget {
  final Book b;
  final Color ct;
  final Color cd;
  

  const MyCustomContainer(
      {super.key,
      required this.b,
      required this.ct,
      required this.cd,
      });

  @override
  State<MyCustomContainer> createState() => _MyCustomContainerState();
}

class _MyCustomContainerState extends State<MyCustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            width: 130,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(widget.b.asset!), fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(4, 4),
                    color: Colors.grey[400]!,
                  )
                ]),
          ),
          BlocBuilder<Favoritecubit, Favoritestate>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    if (state.favorites.contains(Models.kotob[widget.b.id!])) {
                      context.read<Favoritecubit>().removeFromFavorites(Models.kotob[widget.b.id!]);
                      Models.kotob[widget.b.id!].isFavourite = false;
                    }else{
                    context.read<Favoritecubit>().addToFavorites(Models.kotob[widget.b.id!]);
                    Models.kotob[widget.b.id!].isFavourite = true;
                    }
                   
                  },
                  icon: Icon(
                      state.favorites.contains(Models.kotob[widget.b.id!])
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: const Color(0xFF5ABD8C),
                      size: 40));
            },
          )
        ]),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.b.title!,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: widget.ct,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(widget.b.author!,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: widget.cd,
            ))
      ],
    );
  }
}

class Models {
  static Widget getBackgroundImage(Widget w) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image.png"), fit: BoxFit.cover)),
      child: w,
    );
  }

  static Widget myCustomtextField(String txtt, bool obs, TextInputType kt,
      TextEditingController tec, IconData myicon) {
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

  static Widget myCustomDrawerItem(IconData icon, String txt) {
    return GestureDetector(
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

  static Widget myCategoryContainer(String ast, String txt) {
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

  static Widget cardToDisplay(Book b) {
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
            Text("Genre: ${b.genre!}",
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

  static List<Book> kotob = [
    Book(
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      description:
          'A classic novel about racial injustice and the loss of innocence.',
      asset: 'https://covers.openlibrary.org/b/id/12629737-L.jpg',
      genre: 'Fiction',
      rating: 4.8,
      id: 0,
      isFavourite: false,
    ),
    Book(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      description:
          'A novel about the American Dream and the excesses of the Roaring Twenties.',
      asset: 'https://covers.openlibrary.org/b/id/12858676-L.jpg',
      genre: 'Fiction',
      rating: 4.5,
      id: 1,
      isFavourite: false,
    ),
    Book(
      title: '1984',
      author: 'George Orwell',
      description:
          'A dystopian novel about government surveillance and the dangers of totalitarianism.',
      asset: 'https://covers.openlibrary.org/b/id/7222246-L.jpg',
      genre: 'Science Fiction',
      rating: 4.7,
      id: 2,
      isFavourite: false,
    ),
    Book(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description:
          'A classic romance novel about love, family, and social class.',
      asset: 'https://covers.openlibrary.org/b/id/8154299-L.jpg',
      genre: 'Romance',
      rating: 4.6,
      id: 3,
      isFavourite: false,
    ),
    Book(
      title: 'The Catcher in the Rye',
      author: 'J.D. Salinger',
      description: 'A coming-of-age novel about teenage angst and alienation.',
      asset: 'https://covers.openlibrary.org/b/id/10401309-L.jpg',
      genre: 'Fiction',
      rating: 4.4,
      id: 4,
      isFavourite: false,
    ),
    Book(
      title: 'The Hitchhiker\'s Guide to the Galaxy',
      author: 'Douglas Adams',
      description:
          'A comedic science fiction series about space travel and the absurdities of life.',
      asset: 'https://covers.openlibrary.org/b/id/12607988-L.jpg',
      genre: 'Science Fiction',
      rating: 4.5,
      id: 5,
      isFavourite: false,
    ),
    Book(
      title: 'The Lord of the Rings',
      author: 'J.R.R. Tolkien',
      description:
          'A high fantasy novel about friendship, sacrifice, and the battle between good and evil.',
      asset: 'https://covers.openlibrary.org/b/id/13523139-L.jpg',
      genre: 'Fantasy',
      rating: 4.8,
      id: 6,
      isFavourite: false,
    ),
    Book(
      title: 'The Picture of Dorian Gray',
      author: 'Oscar Wilde',
      description:
          'A philosophical novel about beauty, morality, and the corrupting influence of desire.',
      asset: 'https://covers.openlibrary.org/b/id/12580780-L.jpg',
      genre: 'Fiction',
      rating: 4.4,
      id: 7,
      isFavourite: false,
    ),
    Book(
      title: 'The Count of Monte Cristo',
      author: 'Alexandre Dumas',
      description:
          'An adventure novel about betrayal, revenge, and redemption.',
      asset: 'https://covers.openlibrary.org/b/id/10529976-L.jpg',
      genre: 'Fiction',
      rating: 4.6,
      id: 8,
      isFavourite: false,
    ),
    Book(
      title: 'War and Peace',
      author: 'Leo Tolstoy',
      description:
          'A historical novel about love, family, and the Napoleonic Wars.',
      asset: 'https://covers.openlibrary.org/b/id/12626803-L.jpg',
      genre: 'Fiction',
      rating: 4.7,
      id: 9,
      isFavourite: false,
    ),
  ];
}

class Book {
  String? title;
  String? author;
  String? description;
  String? asset;
  String? genre;
  double? rating;
  int? id;
  bool? isAvailable;
  bool isFavourite;

  Book(
      {required this.title,
      required this.author,
      required this.description,
      required this.asset,
      required this.genre,
      required this.rating,
      required this.id,
      required this.isFavourite});

  Book copyWith({bool? isFavourite}) {
    return Book(
      title: title,
      author: author,
      description: description,
      asset: asset,
      genre: genre,
      rating: rating,
      id: id,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
