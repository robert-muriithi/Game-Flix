import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_flix_flutter/config/theme/colors.dart';
import 'package:game_flix_flutter/features/games/domain/model/game.dart';
import '../../domain/model/game_deatils.dart';
import 'package:fluttericon/iconic_icons.dart';

class GameDetailsWidget extends StatefulWidget {
  final GameResults game;
  final GameDetails gameDetails;

  const GameDetailsWidget(
      {Key? key, required this.game, required this.gameDetails})
      : super(key: key);

  @override
  State<GameDetailsWidget> createState() => _GameDetailsWidgetState();
}

class _GameDetailsWidgetState extends State<GameDetailsWidget> {
  bool _isFavorite = false;

  void _addFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text(widget.game.name!),
          actions: [
            IconButton(
              onPressed: () {
                _addFavorite();
              },
              icon: _isFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: AppColors.orange,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: AppColors.white,
                    ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
          ],
          expandedHeight: 270.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(children: [
              CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: widget.gameDetails.backgroundImageAdditional ?? '',
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.darkGrey, Colors.transparent])),
                ),
              ),
              Positioned(
                  top: 150,
                  left: 120,
                  right: 120,
                  bottom: 30,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              widget.gameDetails.backgroundImage ?? '',
                              cacheKey: widget.gameDetails.backgroundImage),
                          fit: BoxFit.cover,
                          scale: 1.0,
                        ),
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              AppColors.darkGrey,
                              Colors.transparent
                            ])),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                widget.game.name!,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                      offset: Offset(5.0, 5.0),
                                    ),
                                  ],
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])),
              Positioned(
                bottom: 1,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.darkGrey, Colors.transparent])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconic.star,
                            color: widget.game.rating! >= 4
                                ? AppColors.lightGreen
                                : AppColors.orange,
                            size: 20,
                          ),
                          Text(
                            widget.game.rating.toString(),
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconic.chart_bar,
                            color: AppColors.orange,
                            size: 20,
                          ),
                          Text(
                            widget.game.reviewsCount.toString(),
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconic.cloud,
                            color: AppColors.orange,
                            size: 20,
                          ),
                          Text(
                            '${widget.game.metaCritic.toString()}%',
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            collapseMode: CollapseMode.parallax,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: true,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  widget.gameDetails.descriptionRaw!,
                  style: const TextStyle(fontSize: 16, color: AppColors.white),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
