part of 'tag_games_bloc.dart';

abstract class TagGamesState extends Equatable {
  const TagGamesState();
}

class TagGamesInitial extends TagGamesState {
  @override
  List<Object> get props => [];
}

class TagGamesLoading extends TagGamesState {
  @override
  List<Object> get props => [];
}

class TagGamesLoaded extends TagGamesState {
  final List<GameDetails> games;

  const TagGamesLoaded({required this.games});

  @override
  List<Object> get props => [games];
}

class TagGamesError extends TagGamesState {
  final String message;

  const TagGamesError({required this.message});

  @override
  List<Object> get props => [message];
}
