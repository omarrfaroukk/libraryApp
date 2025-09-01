import 'dart:core';
import 'package:flutter/material.dart';
import 'books.dart';



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

