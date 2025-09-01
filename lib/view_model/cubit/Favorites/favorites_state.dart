
import '../../../data/models/books.dart';

class Favoritestate {
  final List<Book>favorites;
  Favoritestate(this.favorites);
}

class FavoriteInitial extends Favoritestate {
  FavoriteInitial() : super([]);
}

class FavoritesUpdated extends Favoritestate{
  FavoritesUpdated(super.favorites);
}

class FavoritesError extends Favoritestate{
  FavoritesError(super.favorites);
}