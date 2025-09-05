import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'https://www.googleapis.com/books/v1'));

  Future<List<dynamic>> fetchCategoryBooks(String category) async {
    int startIndex = 0;
    const int maxResults = 10;

    try {
      final response = await _dio.get('/volumes', queryParameters: {
        'q': 'subject:${Uri.encodeComponent(category)}',
        'startIndex': startIndex,
        'maxResults': maxResults
      });
      return response.data['items'] ?? [];
    } catch (e) {
      throw Exception('Failed to fetch books: $e');
    }
  }

 Future<int> getTotalBooks(String category) async {
    try {
      final response = await _dio.get(
        '/volumes',
        queryParameters: {
          'q': 'subject:${Uri.encodeComponent(category)}',
          'maxResults': 1,
        },
      );
      return response.data['totalItems'] ?? 0;
    } catch (e) {
      throw Exception('Failed to fetch total items: $e');
    }
  }
}
