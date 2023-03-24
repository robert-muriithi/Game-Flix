import 'package:flutter/material.dart';
import 'package:game_flix_flutter/config/theme/colors.dart';

import '../../../games/domain/model/game_deatils.dart';
import '../../domain/model/tag.dart';
import 'game_item_widget.dart';
class TagItemWidget extends StatelessWidget {
  final TagResult tag;
  final List<GameDetails> tagGames;
  const TagItemWidget({Key? key, required this.tag, required this.tagGames}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(tag.name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.white))),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
               scrollDirection: Axis.horizontal,
                itemCount: tag.games?.length ?? 0,
                itemBuilder: (context, index) {
                  return TagGameItemWidget(game: tagGames[index]);
                }
            ),
          )
        ],
      ),
    );
  }
}
