import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector.dart';
import '../blocs/games_bloc.dart';
import '../widgets/error_widget.dart';
import '../widgets/genres_list.dart';

class GamesPage extends StatefulWidget {
   const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
        elevation: 1,
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<GamesBloc> buildBody(BuildContext context){
    return BlocProvider(
        create: (_) => sl<GamesBloc>(),
        child: BlocBuilder<GamesBloc, GamesState>(
          builder: (context, state) {
            blocContext = context;

            if(state is GamesInitialState){
              dispatchEvent(context);
            }
            if(state is GamesLoadingState){
              return const Center(child: CircularProgressIndicator());
            }
            else if(state is GamesLoadedState){
              final games = state.games;
              final noMoreData = state.noMoreData;
              return GenresListWidget(
                games: games,
                noMoreData: noMoreData,
              );
            }
            else if(state is GamesErrorState){
              return ErrorMessageWidget(message: state.errorMessage!);
            }else {
              return const ErrorMessageWidget(message: 'An unknown error occurred');
            }

          },
        )
    );
  }

  void dispatchEvent(BuildContext context){
    BlocProvider.of<GamesBloc>(context).add(GetGamesEvent());
  }
}
