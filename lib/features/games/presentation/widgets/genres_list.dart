import 'package:flutter/material.dart';

import '../../domain/model/genre.dart';

class GenresListWidget extends StatefulWidget {
  const GenresListWidget({Key? key, required this.genres}) : super(key: key);
  final List<Genre> genres;

  @override
  State<GenresListWidget> createState() => _GenresListWidgetState();
}

class _GenresListWidgetState extends State<GenresListWidget> {
  @override
  Widget build(BuildContext context) {
    if(widget.genres.isEmpty) {
      return const Center(
      child: Text('No Genres found'));
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          for (var genre in widget.genres)
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Chip(
                label: Text(genre.results.map((e) => e.name).join(', ')
                ),
              ),
            )
        ],
      )
    );
  }
}
