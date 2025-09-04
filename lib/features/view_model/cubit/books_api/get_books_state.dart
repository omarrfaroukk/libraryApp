
import '../../../../data/models/book.dart';

class GetBooksState {}

class BooksInitial extends GetBooksState {}

class BooksLoading extends GetBooksState {}

class BooksLoaded extends GetBooksState {
  List<Book> books;
  BooksLoaded(this.books);
}

class BookError extends GetBooksState {
  String error;
  BookError(this.error);
}
