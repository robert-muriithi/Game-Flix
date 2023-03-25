import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_flix_flutter/feature/games/domain/model/game.dart';
import '../../../../core/widgets/loading/loading.dart';
import '../../../../injector.dart';
import '../../../games/presentation/widgets/error_widget.dart';
import '../../domain/model/genre.dart';
import '../blocs/category_games_bloc/category_games_bloc.dart';
import '../widgets/games_list_widget.dart';

class CategoryGamesPage extends StatelessWidget {
  final Results genre;
  CategoryGamesPage({Key? key, required this.genre}) : super(key: key);

  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(genre.name),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<CategoryGamesBloc> buildBody(BuildContext context){
    return BlocProvider(
      create: (_) => sl<CategoryGamesBloc>(),
      child: BlocBuilder<CategoryGamesBloc, CategoryGamesState>(
        builder: (context, state) {
          blocContext = context;

          if (state is CategoryGamesInitialState) {
            dispatchEvent(context);
          }
          if (state is CategoryGamesLoadingState) {
            return const Center(child: LoadingWidget());
          } else if (state is CategoryGameLoadedState) {
            final games = state.games;
            return GamesListWidget(games: games);

          } else if (state is CategoryGamesErrorState) {
            return ErrorMessageWidget(message: state.message);
          } else {
            return const ErrorMessageWidget(
                message: 'An unknown error occurred');
          }
        },
      ),
    );
  }

  void dispatchEvent(BuildContext context) {
    List<int> ids = [];
    if(genre.game != null){
      for(var game in genre.game!){
        var id = game?.id;
        ids.add(id!);
      }
    }
    BlocProvider.of<CategoryGamesBloc>(context).add(GetCategoryGamesEvent(ids: ids));
  }

}
