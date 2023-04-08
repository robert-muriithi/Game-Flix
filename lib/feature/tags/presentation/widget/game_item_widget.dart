import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../config/routes/routes.dart';
import '../../../../config/theme/colors.dart';
import '../../../games/domain/model/game_deatils.dart';


class TagGameItemWidget extends StatelessWidget {
  const TagGameItemWidget({Key? key, required this.game})
      : super(key: key);
  final GameDetails game;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.gameDetailsPage, arguments: game);
      },
      child: Container(
        width: 150,
        height: 200,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(game.backgroundImage!,
                        cacheKey: game.backgroundImage),
                    fit: BoxFit.cover,
                    scale: 2.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      game.name,
                      style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.orange),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        child: Text(
                          game.metacritic.toString(),
                          style: const TextStyle(
                            color: AppColors.orange,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.white,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  const Text(
                    'Release date',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Expanded(
                    child: Text(
                      game.released ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  const Text(
                    'Genres',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Expanded(
                    child: Text(
                      game.genres?.map((e) => e.name).join(', ') ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}