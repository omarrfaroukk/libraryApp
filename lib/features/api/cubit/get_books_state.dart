
import '../../../data/models/book.dart';

class GetBooksState {}

class BooksInitial extends GetBooksState {}

class BooksLoading extends GetBooksState {}

class BooksLoaded extends GetBooksState {
  final List<Book> books;
  BooksLoaded(this.books);
}

class BookError extends GetBooksState {
  final String error;
  BookError(this.error);
}
