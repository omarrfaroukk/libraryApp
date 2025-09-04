class Book {
  String? title;
  List? authors;
  String? description;
  String? asset;
  String? genre;
  num? rating;
  int? id;
  bool? isAvailable;
  bool isFavourite;
  String? date;
  String? readlink;
  num? pageCount;


  Book(
      {required this.title,
      required this.authors,
      required this.description,
      required this.asset,
      required this.rating,
      this.id,
      required this.isFavourite,
      this.pageCount,
      this.date,
      this.readlink,
      });

  factory Book.fromJson(Map<String,dynamic> json){
    return Book(
      title: json['volumeInfo']['title'] ?? 'Unknown Title',
      authors: List<String>.from(json['volumeInfo']['authors'] ?? []),
      date: json['volumeInfo']['publishedDate'] ?? '',
      description: json['volumeInfo']['description'] ?? 'No Description',
      pageCount: json['volumeInfo']['pageCount'] ?? 0,
      asset: json['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
      rating: json['volumeInfo']['averageRating'] ?? 5 ,
      isFavourite: false
    );
  }
}