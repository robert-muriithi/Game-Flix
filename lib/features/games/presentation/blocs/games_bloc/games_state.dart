part of 'games_bloc.dart';

abstract class GamesState extends Equatable {
  final bool noMoreData;
  final List<GameResults> games;
  final String? errorMessage;

  const GamesState(this.games, this.noMoreData, this.errorMessage);

  @override
  List<Object?> get props => [noMoreData, games];
}

class GamesInitialState extends GamesState {
  GamesInitialState() : super([], false, null);
}

class GamesLoadingState extends GamesState {
  GamesLoadingState() : super([], false, null);
}

class GamesLoadedState extends GamesState {
  const GamesLoadedState(List<GameResults> games, {required bool noMoreData})
      : super(games, noMoreData, null);
}

class GamesErrorState extends GamesState {
  GamesErrorState({required String error}) : super([], true, error);
}

class AddGameToFavoritesState extends GamesState {
  final bool isAdded;

  AddGameToFavoritesState({required this.isAdded}) : super([], false, null);

  @override
  List<Object?> get props => [isAdded];
}
