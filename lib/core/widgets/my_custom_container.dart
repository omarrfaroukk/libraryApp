import 'package:flutter/material.dart';
import 'package:library_app/view_model/cubit/Favorites/favorites_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/models/my_classes.dart';

import '../../data/models/book.dart';
import '../../view_model/cubit/Favorites/favorites_state.dart';
class MyCustomContainer extends StatefulWidget {
  final Book b;
  final Color ct;
  final Color cd;
  

  const MyCustomContainer(
      {super.key,
      required this.b,
      required this.ct,
      required this.cd,
      });

  @override
  State<MyCustomContainer> createState() => _MyCustomContainerState();
}

class _MyCustomContainerState extends State<MyCustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            width: 130,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(widget.b.asset!), fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(4, 4),
                    color: Colors.grey[400]!,
                  )
                ]),
          ),
          BlocBuilder<Favoritecubit, Favoritestate>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    if (state.favorites.contains(kotob[widget.b.id!])) {
                      context.read<Favoritecubit>().removeFromFavorites(kotob[widget.b.id!]);
                      kotob[widget.b.id!].isFavourite = false;
                    }else{
                    context.read<Favoritecubit>().addToFavorites(kotob[widget.b.id!]);
                    kotob[widget.b.id!].isFavourite = true;
                    }
                   
                  },
                  icon: Icon(
                      state.favorites.contains(kotob[widget.b.id!])
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: const Color(0xFF5ABD8C),
                      size: 40));
            },
          )
        ]),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.b.title!,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: widget.ct,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(widget.b.author!,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: widget.cd,
            ))
      ],
    );
  }
}