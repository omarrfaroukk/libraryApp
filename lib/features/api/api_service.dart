import 'package:dio/dio.dart';

import '../../data/models/book.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Book>> fetchAllBook() async {
    const String baseUrl = 'https://www.googleapis.com/books/v1/volumes';
    const String query = 'all';
    int startIndex = 0;
    const int maxResults = 10;

    List<Book> myfetchedBooks = [];

    try {
      while (true) {
        final response = await _dio.get(baseUrl, queryParameters: {
          'q': query,
          'startIndex': startIndex,
          'maxResults': maxResults
        });
        final data = response.data;
        final List<dynamic> items = data['items']?? [];
        if (items.isEmpty) {
          break;
        }
        myfetchedBooks.addAll(items.map((item) => Book.fromJson(item)).toList());
        startIndex += maxResults;
       
       if (data['totalItems'] != null && myfetchedBooks.length >= data['totalItems']) break;
      }
    } catch (e) {
      throw Exception("error occurred $e");
    }
    return myfetchedBooks;
  }


  Future<List<Book>> fetchCategoryBooks(String category) async {
    const String baseUrl = 'https://www.googleapis.com/books/v1/volumes';
    String query = category;
    int startIndex = 0;
    const int maxResults = 10;

    List<Book> myfetchedBooks = [];

    try {
      while (true) {
        final response = await _dio.get(baseUrl, queryParameters: {
          'q': query,
          'startIndex': startIndex,
          'maxResults': maxResults
        });
        final data = response.data;
        final List<dynamic> items = data['items']?? [];
        if (items.isEmpty) {
          break;
        }
        myfetchedBooks.addAll(items.map((item) => Book.fromJson(item)).toList());
        startIndex += maxResults;
       
       if (data['totalItems'] != null && myfetchedBooks.length >= data['totalItems']) break;
      }
    } catch (e) {
      throw Exception("error occurred $e");
    }
    return myfetchedBooks;
  }

  
}
