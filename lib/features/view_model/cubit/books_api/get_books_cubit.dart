import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_service.dart';
import 'get_books_state.dart';

class GetBooksCubit extends Cubit<GetBooksState> {
  final ApiService apiService;
  final String category;
  GetBooksCubit({this.category='',required this.apiService}) : super(BooksInitial());

  Future<void> getBooks() async {
    try {
      emit(BooksLoading());
      await Future.delayed(const Duration(seconds: 2));
      final books = await apiService.fetchCategoryBooks(category);
      emit(BooksLoaded(books));
    } catch (e) {
      String error = e.toString();
      emit(BookError(error));
    }
  }
}
