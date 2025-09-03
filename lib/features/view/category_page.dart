import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  final String asset;

  const CategoryPage({super.key, required this.category, required this.asset});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            backgroundColor: const Color(0xFF5ABD8C),
            title: Text(widget.category,style: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 32, color: Colors.white)),
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(image: AssetImage(widget.asset), fit: BoxFit.fill),
            ),
          )
        ],
      ),
    );
  }
}