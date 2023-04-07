part of 'favorite_game_details_bloc.dart';

abstract class FavoriteGameDetailsState extends Equatable {
  const FavoriteGameDetailsState();
  
  @override
  List<Object> get props => [];
}

class FavoriteGameDetailsInitial extends FavoriteGameDetailsState {
  const FavoriteGameDetailsInitial();

  @override
  List<Object> get props => [];
}

class FavoriteGameDetailsLoading extends FavoriteGameDetailsState {
  const FavoriteGameDetailsLoading();

  @override
  List<Object> get props => [];
}

class FavoriteGameDetailsLoaded extends FavoriteGameDetailsState {
  final GameDetails gameDetails;

  const FavoriteGameDetailsLoaded({required this.gameDetails});

  @override
  List<Object> get props => [gameDetails];
}

class FavoriteGameDetailsError extends FavoriteGameDetailsState {
  final String message;

  const FavoriteGameDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
