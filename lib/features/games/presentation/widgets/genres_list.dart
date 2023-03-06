import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/model/game.dart';
import '../blocs/games_bloc/games_bloc.dart';
import 'game_item_widget.dart';

class GenresListWidget extends StatefulWidget {
  const GenresListWidget({
    Key? key,
    required this.games,
    required this.noMoreData,
  }) : super(key: key);

  final List<GameResults?> games;
  final bool noMoreData;

  @override
  _GenresListWidgetState createState() => _GenresListWidgetState();
}

class _GenresListWidgetState extends State<GenresListWidget> {
  late ScrollController scrollController;

  double scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController
        .addListener(() => onScrollListener(context, scrollController));
  }

  void onScrollListener(
      BuildContext context, ScrollController scrollController) {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      scrollPosition = scrollController.position.pixels;
      BlocProvider.of<GamesBloc>(context).add(GetGamesEvent());
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void jumpToScrollPosition() {
    scrollController.jumpTo(scrollPosition);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.games.isEmpty) {
      return const Center(child: Text('No Games found'));
    }
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification &&
              scrollNotification.metrics.extentAfter == 0) {
            jumpToScrollPosition();
            BlocProvider.of<GamesBloc>(context).add(GetGamesEvent());
          }
          return false;
          /*if (scrollNotification is ScrollStartNotification) {
            scrollPosition = scrollNotification.metrics.pixels;
          }
          if (scrollNotification is ScrollUpdateNotification) {
            if (scrollNotification.metrics.pixels > scrollPosition) {
              // Scroll down
              if (scrollNotification.metrics.pixels > 0) {
                BlocProvider.of<GamesBloc>(context).add(HideAppBarEvent());
              }
            } else {
              // Scroll up
              if (scrollNotification.metrics.pixels < 0) {
                BlocProvider.of<GamesBloc>(context).add(ShowAppBarEvent());
              }
            }
          }
          return true;*/
        },
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5 / 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 7,
          ),
          controller: scrollController,
          itemCount: widget.games.length,
          itemBuilder: (context, index) {
            final game = widget.games[index];
            return GameItemWidget(
              game: game,
            );
          },
        ),
      ),
    );
  }
}
