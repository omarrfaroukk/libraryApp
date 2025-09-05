import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/api_repo.dart';

import 'get_books_state.dart';

class GetBooksCubit extends Cubit<GetBooksState> {
  final ApiRepo _apiRepository;

  GetBooksCubit(this._apiRepository) : super(BooksInitial());

  Future<void> getBooks(String cat) async {
    try {
      emit(BooksLoading());
      await Future.delayed(const Duration(seconds: 2));
      final books = await _apiRepository.fetchCategoryBooks(cat);
      emit(BooksLoaded(books));
    } catch (e) {
      String error = e.toString();
      emit(BookError(error));
    }
  }
}
