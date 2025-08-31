import 'package:bloc/bloc.dart';

import '../data/models/my_classes.dart';
import 'FavoriteState.dart';
class Favoritecubit extends Cubit<Favoritestate> {
  Favoritecubit() : super(FavoriteInitial());
  List<Book> favorites=[];

  void addToFavorites(Book b){
    for (int i = 0 ;i<favorites.length;i++){
      if(favorites[i].id==b.id){
        removeFromFavorites(b);
        return;
      }
    }
    favorites.add(b);
    emit(FavoritesUpdated(List.from(favorites)));

  }

  void removeFromFavorites(Book b){
    favorites.remove(b);
    emit(FavoritesUpdated(List.from(favorites)));
  }
}