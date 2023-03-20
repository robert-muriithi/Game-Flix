part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {
  @override
  List<Object> get props => [];
}

class FavoritesLoading extends FavoritesState {
  @override
  List<Object> get props => [];
}

class FavoritesLoaded extends FavoritesState {
  final GameResults game;

  const FavoritesLoaded({required this.game});

  @override
  List<Object> get props => [game];
}

class FavoritesAdded extends FavoritesState {
  final bool isAdded;

  const FavoritesAdded({required this.isAdded});

  @override
  List<Object> get props => [isAdded];
}

class FavoritesRemoved extends FavoritesState {
  final bool isRemoved;

  const FavoritesRemoved({required this.isRemoved});

  @override
  List<Object> get props => [isRemoved];
}

class FavoritesError extends FavoritesState {
  final String message;

  const FavoritesError({required this.message});

  @override
  List<Object> get props => [message];
}

class FavoritesEmpty extends FavoritesState {
  @override
  List<Object> get props => [];
}
