part of 'tag_games_bloc.dart';

abstract class TagGamesState extends Equatable {
  const TagGamesState();
}

class TagGamesInitialState extends TagGamesState {
  @override
  List<Object> get props => [];
}

class TagGamesLoadingState extends TagGamesState {
  @override
  List<Object> get props => [];
}

class TagGamesLoadedState extends TagGamesState {
  final List<GameDetails> games;

  const TagGamesLoadedState({required this.games});

  @override
  List<Object> get props => [games];
}

class TagGamesErrorState extends TagGamesState {
  final String message;

  const TagGamesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class TagsGamesEmptyState extends TagGamesState {
  final String message;
  const TagsGamesEmptyState({required this.message});

  @override
  List<Object> get props => [message];
}
