import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading/loading.dart';
import '../../../../injector.dart';
import '../../../categories/presentation/widgets/error_widget.dart';
import '../../../games/domain/model/game_deatils.dart';
import '../../../games/presentation/blocs/favorites_bloc/favorites_bloc.dart';
import '../../../games/presentation/blocs/game_details_bloc/game_details_bloc.dart';
import '../widget/tag_game_detail_widget.dart';

class TagGameDetailsPage extends StatelessWidget {
  final GameDetails game;

  TagGameDetailsPage({Key? key, required this.game}) : super(key: key);

  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  MultiBlocProvider buildBody(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<GameDetailsBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<FavoritesBloc>(),
        ),
      ],
      child: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          blocContext = context;
          bool isFavorite = false;
          if (state is FavoritesInitial) {
            dispatchGetFavoriteGameEvent(context);
          } else if (state is FavoritesLoaded) {
            isFavorite = state.game.id!.toString().contains(game.id.toString());
          } else if (state is FavoritesError) {
            isFavorite = false;
          } else {
            isFavorite = false;
          }
          return BlocBuilder<GameDetailsBloc, GameDetailsState>(
            builder: (context, state) {
              blocContext = context;
              if (state is GameDetailsInitialState) {
                dispatchGetGameDetailsEvent(context);
              }
              if (state is GameDetailsLoadingState) {
                return const Center(child: LoadingWidget());
              } else if (state is GameDetailsLoadedState) {
                final gameDetails = state.gameDetails;
                return TagGameDetailsWidget(
                  gameDetails: gameDetails,
                  isFavorite: isFavorite,
                );
              } else if (state is GameDetailsErrorState) {
                return ErrorMessageWidget(message: state.message);
              } else {
                return const ErrorMessageWidget(
                    message: 'An unknown error occurred');
              }
            },
          );
        },
      ),
    );
  }

  void dispatchGetGameDetailsEvent(BuildContext context) {
    BlocProvider.of<GameDetailsBloc>(context)
        .add(GetGameDetailsEvent(id: game.id));
  }

  void dispatchGetFavoriteGameEvent(BuildContext context) {
    BlocProvider.of<FavoritesBloc>(context).add(GetFavoriteEvent(id: game.id));
  }
}
