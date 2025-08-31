class Book {
  String? title;
  String? author;
  String? description;
  String? asset;
  String? genre;
  double? rating;
  int? id;
  bool? isAvailable;
  bool isFavourite;

  Book(
      {required this.title,
      required this.author,
      required this.description,
      required this.asset,
      required this.genre,
      required this.rating,
      required this.id,
      required this.isFavourite});

  Book copyWith({bool? isFavourite}) {
    return Book(
      title: title,
      author: author,
      description: description,
      asset: asset,
      genre: genre,
      rating: rating,
      id: id,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}