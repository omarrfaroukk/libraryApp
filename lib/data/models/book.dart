class Book {
  String? title;
  List? authors;
  String? description;
  String? asset;
  String? genre;
  double? rating;
  int? id;
  bool? isAvailable;
  bool isFavourite;
  int? date;
  String? readlink;
  int? pageCount;


  Book(
      {required this.title,
      required this.authors,
      required this.description,
      required this.asset,
      required this.rating,
      required this.id,
      required this.isFavourite,
      this.pageCount,
      this.date,
      this.readlink,
      });

  Book copyWith({bool? isFavourite}) {
    return Book(
      title: title,
      authors: authors,
      description: description,
      asset: asset,
      rating: rating,
      id: id,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  factory Book.fromJson(Map<String,dynamic> json){
    return Book(
      id: json['volumeInfo']['id'] ?? '',
      title: json['volumeInfo']['title'] ?? 'Unknown Title',
      authors: List<String>.from(json['volumeInfo']['authors'] ?? []),
      date: json['volumeInfo']['publishedDate'] ?? 'Unknown Date',
      description: json['volumeInfo']['description'] ?? 'No Description',
      pageCount: json['volumeInfo']['pageCount'] ?? 0,
      asset: json['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
      rating: json['volumeInfo']['averageRating'] ?? 0.0,
      isFavourite: false
    );
  }
}