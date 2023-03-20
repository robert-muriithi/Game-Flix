part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
}

class GetFavoriteEvent extends FavoritesEvent {
  final int id;

  const GetFavoriteEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class AddGameToFavoritesEvent extends FavoritesEvent {
  final GameResults game;

  const AddGameToFavoritesEvent({required this.game});

  @override
  List<Object?> get props => [game];
}

class RemoveGameFromFavoritesEvent extends FavoritesEvent {
  final int id;

  const RemoveGameFromFavoritesEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
