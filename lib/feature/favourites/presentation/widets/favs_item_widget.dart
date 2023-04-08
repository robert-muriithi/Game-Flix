import 'package:flutter/material.dart';
import 'package:game_flix_flutter/config/theme/colors.dart';
import '../../../games/domain/model/game.dart';
import '../pages/favorite_game_details.dart';

class FavsItemWidget extends StatelessWidget {
  final GameResults game;
  Function()? onRemove;

  FavsItemWidget({Key? key, required this.game, this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      onDismissed: (direction) {
        onRemove?.call();
      },
      background: Container(
        decoration: const BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoriteGameDetails(game: game))
          );
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.darkGrey, borderRadius: BorderRadius.circular(10)),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                    children: [
                      Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      game.backgroundImage),
                                  fit: BoxFit.cover)
                          )
                      ),
                    ],
                  )),
              Container(
                padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        game.name ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                            fontSize: 20
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Text('Released on: ${game.released}',
                        style: const TextStyle(color: AppColors.white, fontSize: 12)),
                    Text('Rating: ${game.rating.toString()}/5',
                        style: const TextStyle(color: AppColors.white, fontSize: 12)),
                    Text('Overall Rating: ${game.metaCritic.toString()}%',
                        style: const TextStyle(color: AppColors.white, fontSize: 12)),
                    Text('Genres: ${game.genres?.map((e) => e.name).toList()}',
                        style: const TextStyle(color: AppColors.white, fontSize: 12)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.favorite, color: AppColors.orange),
              )
            ],
          ),
        ),
      ),
    );
  }
}
