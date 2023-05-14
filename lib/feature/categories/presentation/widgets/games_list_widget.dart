import 'package:flutter/material.dart';
import 'package:game_flix_flutter/feature/games/domain/model/game.dart';
import 'game_item_widget.dart';

class GamesListWidget extends StatelessWidget {
  final List<GameResults> games;

  const GamesListWidget({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: GridView.builder(
          itemCount: games.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5 / 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 7,
          ),
          itemBuilder: (context, index) {
            final game = games[index];
            return CategoryGameItemWidget(
              game: game,
            );
          }),
    );
  }
}
