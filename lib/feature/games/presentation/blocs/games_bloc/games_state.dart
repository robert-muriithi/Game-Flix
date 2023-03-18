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

class GameAddedToFavoritesState extends GamesState {
   final bool isAdded;
   GameAddedToFavoritesState({required this.isAdded}) : super([], false, null);
}

class GameFavoriteInitialState extends GamesState {
   GameFavoriteInitialState() : super([], false, null);
}

class GameRemovedFromFavoritesState extends GamesState {
   final bool isRemoved;
   GameRemovedFromFavoritesState({required this.isRemoved}) : super([], false, null);
}
