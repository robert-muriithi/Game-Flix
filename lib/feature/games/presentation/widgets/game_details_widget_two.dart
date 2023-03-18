/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector.dart';
import '../../domain/model/game.dart';
import '../../domain/model/game_deatils.dart';
import '../blocs/favorites_bloc/favorites_bloc.dart';
import '../blocs/games_bloc/games_bloc.dart';

class GameDetailsWidget extends StatelessWidget {
  final GameResults game;
  final GameDetails gameDetails;

   GameDetailsWidget({
     Key? key,
     required this.game,
     required this.gameDetails
   }) : super(key: key);

  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  MultiBlocProvider _buildBody(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<FavoritesBloc>().add(GetFavoriteEvent(id: game.id)),
          *//*GamesBloc(
            gamesRepository: GamesRepositoryImpl(
              gamesRemoteDataSource: GamesRemoteDataSourceImpl(
                client: http.Client(),
              ),
              gamesLocalDataSource: GamesLocalDataSourceImpl(
                sharedPreferences: SharedPreferences.getInstance(),
              ),
            ),
          )..add(GetGamesEvent())*//*
        ),
        BlocProvider(
          create: (context) => FavoritesBloc(
            gamesRepository: GamesRepositoryImpl(
              gamesRemoteDataSource: GamesRemoteDataSourceImpl(
                client: http.Client(),
              ),
              gamesLocalDataSource: GamesLocalDataSourceImpl(
                sharedPreferences: SharedPreferences.getInstance(),
              ),
            ),
          ),
        ),
      ],
      child: BlocBuilder<GamesBloc, GamesState>(
        builder: (context, state) {
          blocContext = context;
          if (state is GamesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GamesLoadedState) {
            return _buildGameDetailsWidget(context, state.games);
          } else if (state is GamesErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}*/
