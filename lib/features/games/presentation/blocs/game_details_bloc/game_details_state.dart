part of 'game_details_bloc.dart';

abstract class GameDetailsState extends Equatable {
  const GameDetailsState();
}

class GameDetailsInitialState extends GameDetailsState {
  @override
  List<Object> get props => [];
}

class GameDetailsLoadingState extends GameDetailsState {
  @override
  List<Object> get props => [];
}

class GameDetailsLoadedState extends GameDetailsState {
  final GameDetails gameDetails;
  const GameDetailsLoadedState({required this.gameDetails});

  @override
  List<Object> get props => [gameDetails];
}

class GameDetailsErrorState extends GameDetailsState {
  final String message;
  const GameDetailsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
