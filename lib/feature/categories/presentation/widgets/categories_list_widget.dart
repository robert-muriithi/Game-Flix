import 'package:flutter/material.dart';
import '../../domain/model/genre.dart';
import 'category_item.dart';

class CategoriesListWidget extends StatelessWidget {
  final List<Results>? genres;

  const CategoriesListWidget({Key? key, required this.genres})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 7,
        ),
        itemCount: genres!.length,
        itemBuilder: (context, index) {
          final genre = genres![index];
          return CategoryItem(genre: genre);
        },
      ),
    );
  }
}
