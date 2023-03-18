part of 'games_bloc.dart';

abstract class GamesEvent extends Equatable {
  const GamesEvent();
}

class GetGamesEvent extends GamesEvent {
  @override
  List<Object?> get props => [];
}

class RefreshGamesEvent extends GamesEvent {
  @override
  List<Object?> get props => [];
}

class HideAppBarEvent extends GamesEvent {
  @override
  List<Object?> get props => [];
}

class AddGameToFavoritesEvent extends GamesEvent {
  final GameResults game;

  const AddGameToFavoritesEvent({required this.game});

  @override
  List<Object?> get props => [game];
}

class RemoveGameFromFavoritesEvent extends GamesEvent {
  final GameResults game;

  const RemoveGameFromFavoritesEvent({required this.game});

  @override
  List<Object?> get props => [game];
}

