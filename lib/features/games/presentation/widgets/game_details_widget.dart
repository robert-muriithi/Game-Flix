import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_flix_flutter/config/theme/colors.dart';
import 'package:game_flix_flutter/features/games/domain/model/game.dart';
import '../../domain/model/game_deatils.dart';

class GameDetailsWidget extends StatelessWidget {
  final GameResults game;
  final GameDetails gameDetails;
  const GameDetailsWidget({Key? key, required this.game, required this.gameDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(game.name!),
      ),*/
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(game.name!),
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: gameDetails.backgroundImageAdditional ?? '',
              ),
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    gameDetails.descriptionRaw!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.white
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
