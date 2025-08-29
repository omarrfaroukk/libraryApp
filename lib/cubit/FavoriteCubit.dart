import 'package:bloc/bloc.dart';

import '../data/models/my_classes.dart';
import 'FavoriteState.dart';
class Favoritecubit extends Cubit<Favoritestate> {
  Favoritecubit() : super(FavoriteInitial());
  List<Book> favorites=[];

  void addToFavorites(Book b){
    if(favorites.contains(b)){
     removeFromFavorites(b);
    }else{
    favorites.add(b);
    emit(FavoritesUpdated(List.from(favorites)));
    }
    
  }

  void removeFromFavorites(Book b){
    favorites.remove(b);
    emit(FavoritesUpdated(List.from(favorites)));
  }
}