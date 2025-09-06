import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/widgets/new_custom_container.dart';
import 'package:library_app/features/api/cubit/get_books_cubit.dart';
import 'package:library_app/features/api/cubit/get_books_state.dart';



class CategoryPage extends StatefulWidget {
  final String category;
  final String asset;

  const CategoryPage({super.key, required this.category, required this.asset});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetBooksCubit>(context).getBooks(widget.category);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            backgroundColor: const Color(0xFF5ABD8C),
            title: Text(widget.category,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    color: Colors.white)),
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  Image(image: AssetImage(widget.asset), fit: BoxFit.fill),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<GetBooksCubit, GetBooksState>(
              builder: (context, state) {
                if (state is BooksLoading) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 6,
                        color: Color(0xFF5ABD8C),
                                            ),
                    ],
                  );
                } else if (state is BookError) {
                  return Center(child: Text(state.error));
                } else if (state is BooksLoaded) {
                  return SizedBox(
                    height: 800,
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: state.books.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                  
                                child: NewCustomContainer(
                                  b: state.books[index],
                                  ct: const Color(0xFF707070),
                                  cd: const Color(0xFF707070),
                                ),
                              ));
                        }),
                  );
                }
                return const Center(child: Text('Initial State'));
              },
            ),
          )
        ],
      ),
    );
  }
}
