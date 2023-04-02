


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_flix_flutter/feature/favourites/presentation/bloc/favorite_game_details_bloc/bloc/bloc/favorite_game_details_bloc.dart';
import 'package:game_flix_flutter/feature/favourites/presentation/widets/favs_item_details.dart';
import 'package:game_flix_flutter/feature/games/domain/model/game.dart';
import 'package:game_flix_flutter/feature/games/presentation/widgets/error_widget.dart';
import 'package:game_flix_flutter/injector.dart';

class FavoriteGameDetails extends StatelessWidget {
  final GameResults game;
  FavoriteGameDetails({Key? key, required this.game}) : super(key: key);

 BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<FavoriteGameDetailsBloc> _buildBody(BuildContext context){
    return BlocProvider(
      create: (context) => sl<FavoriteGameDetailsBloc>(),
      child: BlocBuilder<FavoriteGameDetailsBloc, FavoriteGameDetailsState>(
        builder: (context, state){
          blocContext = context;
          if(state is FavoriteGameDetailsInitial){
            dispatchGetFavoriteGameDetailsEvent(context);
          }
          if(state is FavoriteGameDetailsLoaded){
            final gameDetails = state.gameDetails;
            return FavoriteItemWidget(
              game: game,
              gameDetails: gameDetails,
              );
          } else if(state is FavoriteGameDetailsError){
            return ErrorMessageWidget(message: state.message);
          } else {
            return const ErrorMessageWidget(message: 'Something went wrong');
          }
        },
      ),
    );
  }

  void dispatchGetFavoriteGameDetailsEvent(BuildContext context){
    BlocProvider.of<FavoriteGameDetailsBloc>(context).add(GetFavoriteGameDetails(id: game.id!));
  }

}