part of 'category_games_bloc.dart';

abstract class CategoryGamesState extends Equatable {
  const CategoryGamesState();
}

class CategoryGamesInitialState extends CategoryGamesState {
  @override
  List<Object> get props => [];
}

class CategoryGamesLoadingState extends CategoryGamesState {
  @override
  List<Object> get props => [];
}

class CategoryGamesLoadedState extends CategoryGamesState {
  final GameResults games;

  const CategoryGamesLoadedState({required this.games});

  @override
  List<Object> get props => [games];
}

class CategoryGameLoadedState extends CategoryGamesState {
  final List<GameResults> games;

  const CategoryGameLoadedState({required this.games});

  @override
  List<Object> get props => [games];
}

class CategoryGamesErrorState extends CategoryGamesState {
  final String message;

  const CategoryGamesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

// Path: lib\features\categories\presentation\blocs\categories_bloc\category_games_state.dart
