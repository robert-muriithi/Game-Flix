part of 'favorite_game_details_bloc.dart';

abstract class FavoriteGameDetailsEvent extends Equatable {
  const FavoriteGameDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteGameDetails extends FavoriteGameDetailsEvent {
  final int id;

  const GetFavoriteGameDetails({required this.id});

  @override
  List<Object> get props => [id];
}
