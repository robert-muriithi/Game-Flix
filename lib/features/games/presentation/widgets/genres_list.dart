import 'package:flutter/material.dart';
import '../../domain/model/genre.dart';

class GenresListWidget extends StatefulWidget {
  const GenresListWidget({Key? key, required this.genres}) : super(key: key);
  final List<Results?> genres;

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
      height: 50,
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.genres.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5.0),
              ),
              padding: const EdgeInsets.all(5),
              child: Text(widget.genres[index]!.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),),
            ),
          );
        },
      ),

      /*Row(
        children: [
          for (var genre in widget.genres)
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(genre.results!.map((e) => e.name).join(''),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            )
        ],
      )*/
    );
  }
}
