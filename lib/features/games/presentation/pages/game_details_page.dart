import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector.dart';
import '../../domain/model/game.dart';
import '../blocs/game_details_bloc/game_details_bloc.dart';
import '../widgets/error_widget.dart';
import '../widgets/game_details_widget.dart';

class GameDetailsPage extends StatelessWidget {
  final GameResults game;
  GameDetailsPage({Key? key, required this.game}) : super(key: key);

  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }
 /* PreferredSizeWidget buildAppBar(){
    return AppBar(
      title:  Container(
        margin: const EdgeInsets.only(top: 10),
        child:  Text(game.name!),
      )
    );
  }*/

  BlocProvider<GameDetailsBloc> buildBody(BuildContext context){
    return BlocProvider(
        create: (_) => sl<GameDetailsBloc>(),
        child: BlocBuilder<GameDetailsBloc, GameDetailsState>(
          builder: (context, state) {
            blocContext = context;

            if(state is GameDetailsInitialState){
              dispatchEvent(context);
            }
            if(state is GameDetailsLoadingState){
              return const Center(child: CircularProgressIndicator());
            }
            else if(state is GameDetailsLoadedState){
              final gameDetails = state.gameDetails;
              return GameDetailsWidget(
                gameDetails: gameDetails,
                game : game,
              );
            }
            else if(state is GameDetailsErrorState){
              return ErrorMessageWidget(message: state.message);
            }else {
              return const ErrorMessageWidget(message: 'An unknown error occurred');
            }
          },
        )
    );
  }

  void dispatchEvent(BuildContext context){
    BlocProvider.of<GameDetailsBloc>(context).add(GetGameDetailsEvent(id: game.id!));
  }


}
