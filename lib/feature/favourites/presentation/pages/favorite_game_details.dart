import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_flix_flutter/core/widgets/loading/loading.dart';
import 'package:game_flix_flutter/feature/favourites/presentation/bloc/favorite_game_details_bloc/bloc/bloc/favorite_game_details_bloc.dart';
import 'package:game_flix_flutter/feature/favourites/presentation/widets/favs_item_details.dart';
import 'package:game_flix_flutter/feature/games/domain/model/game.dart';
import 'package:game_flix_flutter/feature/games/presentation/widgets/error_widget.dart';
import 'package:game_flix_flutter/injector.dart';
import 'package:logger/logger.dart';

import '../../../games/presentation/blocs/favorites_bloc/favorites_bloc.dart';

class FavoriteGameDetails extends StatelessWidget {
  final GameResults game;
  FavoriteGameDetails({Key? key, required this.game}) : super(key: key);

 BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  final log = Logger();
  MultiBlocProvider buildBody(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => sl<FavoriteGameDetailsBloc>()
        ),
        BlocProvider(
          create: (_) => sl<FavoritesBloc>(),
        ),
      ],
      child: BlocBuilder<FavoriteGameDetailsBloc, FavoriteGameDetailsState>(
        builder: (context, state){
          blocContext = context;
          if(state is FavoriteGameDetailsInitial){
            dispatchGetFavoriteGameDetailsEvent(context);
          }
          if(state is FavoriteGameDetailsLoading){
            return const Center(child: LoadingWidget());
          } else if(state is FavoriteGameDetailsLoaded){
            log.d('Game Results Genres: ${game.genres}');
            log.d('GameDetails Genres: ${state.gameDetails.genres}');
            final gameDetails = state.gameDetails;
            return FavoriteItemWidget(
                game: game,
                gameDetails: gameDetails
            );
          }else if(state is FavoriteGameDetailsError){
            final errorMessage = state.message;
            return ErrorMessageWidget(message: errorMessage);
          }else {
            return const ErrorMessageWidget(message: 'Unknown error occurred');
          }
        },
      ),
    );
  }


  void dispatchGetFavoriteGameDetailsEvent(BuildContext context){
    BlocProvider.of<FavoriteGameDetailsBloc>(context).add(GetFavoriteGameDetails(id: game.id!));
  }

}