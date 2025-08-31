import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/widgets/my_custom_drawer_item.dart';
import 'package:library_app/view_model/cubit/Favorites/favorites_state.dart';
import 'package:library_app/data/models/my_classes.dart';
import 'package:library_app/view/pages/my_books.dart';
import 'package:library_app/view/auth/choose_join.dart';

import '../../core/widgets/my_custom_container.dart';
import '../../view_model/cubit/Favorites/favorites_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF5ABD8C),
        centerTitle: true,
        title: const Text(
          "Booky",
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
                icon: Icons.search_rounded,
                color: Colors.white,
              ))
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      icon: Icons.close_rounded,
                      color: Color(0xFF5ABD8C),
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                "Welcome, Book_Nerd!",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Color(0xFF5ABD8C),
                ),
              ),
              const SizedBox(height: 10),
              const MyCustomDrawerItem(icon: Icons.person_2_rounded, txt: "Profile"),
              const SizedBox(height: 10),
              const MyCustomDrawerItem(icon: Icons.folder_rounded,txt:  "Catalog"),
              const SizedBox(height: 10),
              const MyCustomDrawerItem(icon: Icons.groups_rounded, txt: "Friends"),
              const SizedBox(height: 10),
              const MyCustomDrawerItem(icon: Icons.people_alt_rounded,txt:  "Groups"),
              const SizedBox(height: 10),
              const MyCustomDrawerItem(icon: Icons.event_rounded,txt:  "Events"),
              const SizedBox(height: 10),
              const MyCustomDrawerItem(icon: Icons.settings_rounded,txt: "Settings"),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseJoin()));
                  },
                  child: Models.myCustomDrawerItem(
                      icon: Icons.logout_outlined, "Log out")),
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image.png"), fit: BoxFit.cover)),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: 500,
                  height: 500,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/onAppBar.png"),
                          fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Text(
                          "Recently added",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        height: 300,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: Models.kotob.length,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemExtent: 170,
                          itemBuilder: (context, index) {
                            return MyCustomContainer(
                              b: Models.kotob[index],
                              ct: const Color(0xFF707070),
                              cd: const Color(0xFF707070),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                BlocBuilder<Favoritecubit, Favoritestate>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyBooks()));
                      },
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
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
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: double.infinity,
                              height: 300,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.favorites.length,
                                  itemBuilder: (context, index) {
                                    return MyCustomContainer(
                                      b: state.favorites[index],
                                      ct: const Color(0xFF707070),
                                      cd: const Color(0xFF707070),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(
                    "Categoriess",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Color(0xFF5ABD8C)),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Models.myCategoryContainer(
                            "assets/categories/fantasy.png", "Fantasy"),
                        Models.myCategoryContainer(
                            "assets/categories/fiction.png", "Fiction"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Models.myCategoryContainer(
                            "assets/categories/Crime.png", "Crime"),
                        Models.myCategoryContainer(
                            "assets/categories/youngad.png", "Young Adult"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Models.myCategoryContainer(
                            "assets/categories/horror.png", "Horror"),
                        Models.myCategoryContainer(
                            "assets/categories/romance.png", "Romance"),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
