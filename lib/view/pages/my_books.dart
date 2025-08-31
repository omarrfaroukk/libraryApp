import 'package:flutter/material.dart';
import 'package:library_app/cubit/FavoriteCubit.dart';
import 'package:library_app/data/models/my_classes.dart';
import 'package:library_app/view/pages/book_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/FavoriteState.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<MyBooks> createState() => _MyBooksState();
}


class _MyBooksState extends State<MyBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: const Color(0xFF5ABD8C),
          centerTitle: true,
          title: const Text(
            "My Books",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: Colors.white,
                fontStyle: FontStyle.italic),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ))
          ],
        ),
        body: BlocBuilder<Favoritecubit,Favoritestate>(
          builder:(context,state){
            return (state is FavoriteInitial)? 
            const Center(child: Text("No favorites"))
            :
            ListView(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(
                    "My books ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Color(0xFF5ABD8C)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 900,
                    child: ListView.builder(
                      itemCount: state.favorites.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetails(b: state.favorites[index],)));
                              },
                              child: MyCustomContainer(
                                b: state.favorites[index],
                                ct: const Color(0xFF707070),
                                cd: const Color(0xFF707070),
                               
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            );        
        })
    
  );
}
}
