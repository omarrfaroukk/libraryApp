import 'package:dio/dio.dart';
import '../../../data/models/book.dart';
import '../service/api_service.dart';

class ApiRepo {
  final ApiService _apiService;
  static const int _maxResults = 10;

  ApiRepo(this._apiService);

  Future<List<Book>> fetchCategoryBooks(String category) async {
    try {
      int startIndex = 0;
      List<Book> books = [];
      final totalItems = await _apiService.getTotalBooks(category);
      while (books.length < totalItems) {
        final rawBooks = await _apiService.fetchCategoryBooks(category);
        if (rawBooks.isEmpty) {
          break;
        }
        books.addAll(rawBooks.map((item) => Book.fromJson(item)).toList());
        startIndex += _maxResults;
        if (startIndex < totalItems) {
      await Future.delayed(const Duration(seconds: 1));
    }
      }

      return books;
    } on DioException catch (e) {
      throw Exception('Failed to fetch books: ${e.message}');
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}