part of 'game_details_bloc.dart';

abstract class GameDetailsEvent extends Equatable {
  const GameDetailsEvent();
}

class GetGameDetailsEvent extends GameDetailsEvent {
  final int id;
  const GetGameDetailsEvent({ required this.id});

  @override
  List<Object> get props => [id];
}
