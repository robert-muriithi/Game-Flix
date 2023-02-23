part of 'games_bloc.dart';

abstract class GamesState extends Equatable {
  const GamesState();
}

class GamesInitialState extends GamesState {
  @override
  List<Object?> get props => [];
}

class GamesLoadingState extends GamesState {
  @override
  List<Object?> get props => [];
}

class GamesLoadedState extends GamesState {
  const GamesLoadedState({required this.results});
  final List<Results> results;


  @override
  List<Object?> get props => [
    results
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