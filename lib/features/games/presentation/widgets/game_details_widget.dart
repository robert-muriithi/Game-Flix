import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_flix_flutter/config/theme/colors.dart';
import 'package:game_flix_flutter/features/games/domain/model/game.dart';
import '../../domain/model/game_deatils.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../pages/screenshots_page.dart';

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
          shrinkWrap: true,
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
                                fontWeight: FontWeight.bold
                            ),
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
          fillOverscroll: true,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children:[
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 5, left: 5),
                          child: Text('Genres', style: TextStyle(color: AppColors.white, fontSize: 16),),
                        ),
                        Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.game.genres!.length,
                                itemBuilder: (context, index){
                                  final genre = widget.game.genres![index];
                                  return Container(
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.darkGrey
                                    ),
                                    child: Center(child: Text(genre.name ?? '')),
                                  );
                                }
                            )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Description', style: TextStyle(color: AppColors.white, fontSize: 16),),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.gameDetails.descriptionRaw!,
                          style: const TextStyle(color: AppColors.white),
                          textAlign: TextAlign.justify,
                          maxLines: 9,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Platforms', style: TextStyle(color: AppColors.white),),
                        Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.game.platforms!.length,
                                itemBuilder: (context, index){
                                  final platform = widget.game.platforms![index];
                                  final number = index + 1;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        if(platform.platform!.name!.contains('PlayStation')) const Icon(Icons.place)
                                        else if(platform.platform!.name!.contains('Xbox')) const Icon(Icons.abc)
                                        else const Icon(Icons.access_alarm),
                                        Text('$number ${platform.platform!.name!}', style: const TextStyle(color: AppColors.white)),
                                      ],
                                    ),
                                  );
                                }
                            )
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 5, left: 5),
                          child: Text('Tags', style: TextStyle(color: AppColors.white, fontSize: 16),),
                        ),
                        Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.game.tags!.length,
                                itemBuilder: (context, index){
                                  final tag = widget.game.tags![index];
                                  return Container(
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.darkGrey
                                    ),
                                    child: Center(child: Row(
                                      children: [
                                        const Icon(
                                          Icons.bookmark,
                                          color: AppColors.orange,
                                        ),
                                        Text(tag.name ?? '', style: const TextStyle(color: AppColors.white),)
                                      ],
                                    )),
                                  );
                                }
                            )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 5, left: 5),
                          child: Text('Screenshots', style: TextStyle(color: AppColors.white, fontSize: 16),),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 150,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                              ),
                              items: widget.game.shortScreenshots!.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenshotsPage(screenshot: i.image!)));
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: const BoxDecoration(
                                          color: AppColors.darkGrey,
                                        ),
                                        child: Image.network(
                                          i.image!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]
          ),
        )
      ],
    ));
  }
}
