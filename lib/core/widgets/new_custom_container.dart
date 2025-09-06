import 'package:flutter/material.dart';
import 'package:library_app/features/view_model/cubit/Favorites/favorites_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/models/my_classes.dart';

import '../../data/models/book.dart';
import '../../features/view_model/cubit/Favorites/favorites_state.dart';

class NewCustomContainer extends StatefulWidget {
  final Book b;
  final Color ct;
  final Color cd;

  const NewCustomContainer({
    super.key,
    required this.b,
    required this.ct,
    required this.cd,
  });

  @override
  State<NewCustomContainer> createState() => _NewCustomContainerState();
}

class _NewCustomContainerState extends State<NewCustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            width: 90,
            height: 130,
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
                      context
                          .read<Favoritecubit>()
                          .removeFromFavorites(kotob[widget.b.id!]);
                      kotob[widget.b.id!].isFavourite = false;
                    } else {
                      context
                          .read<Favoritecubit>()
                          .addToFavorites(kotob[widget.b.id!]);
                      kotob[widget.b.id!].isFavourite = true;
                    }
                  },
                  icon: Icon(
                      state.favorites.contains(kotob[widget.b.id ?? 0])
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: const Color(0xFF5ABD8C),
                      size: 40));
            },
          )
        ]),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(widget.b.title!,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: widget.ct,
              )),
        ),
        Text([widget.b.authors].join(", "),
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: widget.cd,
            ))
      ],
    );
  }
}
