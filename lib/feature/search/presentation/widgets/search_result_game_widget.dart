import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../config/theme/colors.dart';
import '../../../games/domain/model/game_deatils.dart';
import '../../../games/presentation/pages/screenshots_page.dart';
import '../../domain/model/search_results_model.dart';

class SearchResultGameWidget extends StatelessWidget {
  final GameDetails game;
  final SearchResultsModel result;

  const SearchResultGameWidget(
      {Key? key, required this.game, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text(game.name),
          actions: buildAppBarActions(context),
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
                imageUrl: game.backgroundImageAdditional ?? '',
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
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              game.backgroundImage ?? '',
                              cacheKey: game.backgroundImage),
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
                                game.name,
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
                  ],
                ),
              ),
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
                            color: game.creatorsCount! >= 400
                                ? AppColors.lightGreen
                                : AppColors.orange,
                            size: 20,
                          ),
                          Text(
                            game.creatorsCount.toString(),
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
                            Iconic.info,
                            color: AppColors.orange,
                            size: 20,
                          ),
                          Text(
                            game.website.toString(),
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
                            '${game.metacritic.toString()}%',
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
          child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
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
                            child: Text(
                              'Genres',
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 16),
                            ),
                          ),
                          Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: result.genres!.length,
                                  itemBuilder: (context, index) {
                                    final genre = result.genres![index];
                                    return Container(
                                      margin: const EdgeInsets.all(5),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColors.darkGrey),
                                      child:
                                          Center(child: Text(genre.name)),
                                    );
                                  })),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Description',
                            style:
                                TextStyle(color: AppColors.white, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            game.descriptionRaw!,
                            style: const TextStyle(color: AppColors.white),
                            textAlign: TextAlign.justify,
                            maxLines: 20,
                            overflow: TextOverflow.fade,
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
                            child: Text(
                              'Screenshots',
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 150,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                ),
                                items: result.screenShots?.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreenshotsPage(
                                                      screenshot:
                                                          i.image),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: const BoxDecoration(
                                            color: AppColors.darkGrey,
                                          ),
                                          child: Image.network(
                                            i.image,
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
                    Container(
                      width: double.infinity,
                      height: 170,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 5, left: 5),
                            child: Text(
                              'Developers',
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: game.developers!.length,
                              itemBuilder: (context, index) {
                                final developer = game.developers![index];
                                return Container(
                                    width: 90,
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color:
                                            AppColors.darkGrey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 35,
                                          backgroundImage: NetworkImage(
                                              developer.imageBackground),
                                        ),
                                        const Spacer(),
                                        Expanded(
                                          child: Text(
                                            developer.name,
                                            style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 11,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            softWrap: true,
                                          ),
                                        )
                                      ],
                                    ));
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ]),
        )
      ],
    ));
  }

  List<Widget> buildAppBarActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.share),
        onPressed: () {
          Share.share('Check out this game ${game.name}');
        },
      ),
    ];
  }
}
