part of 'games_bloc.dart';

abstract class GamesState extends Equatable {
  const GamesState();
}

class GamesInitialState extends GamesState {
  const GamesInitialState();
  @override
  List<Object> get props => [];
}

class GamesLoadingState extends GamesState {
  const GamesLoadingState();
  @override
  List<Object?> get props => [];
}

class GamesLoadedState extends GamesState {
  const GamesLoadedState({ required this.genres});
  final List<Genre> genres;

  @override
  List<Object?> get props => [
    genres
  ];
}

class GamesErrorState extends GamesState {
  final String message;
  const GamesErrorState({required this.message});

  @override
  List<Object?> get props => [
    message
  ];
}