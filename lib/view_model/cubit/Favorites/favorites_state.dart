import 'package:library_app/data/models/my_classes.dart';

import '../../../data/models/Books.dart';

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