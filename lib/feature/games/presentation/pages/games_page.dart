import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading/loading.dart';
import '../../../../injector.dart';
import '../blocs/games_bloc/games_bloc.dart';
import '../widgets/error_widget.dart';
import '../widgets/genres_list.dart';

class GamesPage extends StatelessWidget {
  GamesPage({Key? key}) : super(key: key);

  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
        title: Container(
      margin: const EdgeInsets.only(top: 10),
      child: const Text('Games'),
    ));
  }

  BlocProvider<GamesBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<GamesBloc>(),
        child: BlocBuilder<GamesBloc, GamesState>(
          builder: (context, state) {
            blocContext = context;

            if (state is GamesInitialState) {
              dispatchEvent(context);
            }
            if (state is GamesLoadingState) {
              return const Center(child: LoadingWidget());
            } else if (state is GamesLoadedState) {
              final games = state.games;
              final noMoreData = state.noMoreData;
              return GenresListWidget(
                games: games,
                noMoreData: noMoreData,
              );
            } else if (state is GamesErrorState) {
              return ErrorMessageWidget(message: state.errorMessage!);
            } else {
              return const ErrorMessageWidget(
                  message: 'An unknown error occurred');
            }
          },
        ));
  }

  void dispatchEvent(BuildContext context) {
    BlocProvider.of<GamesBloc>(context).add(GetGamesEvent());
  }
}
