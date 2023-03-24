part of 'tag_games_bloc.dart';

abstract class TagGamesEvent extends Equatable {
  const TagGamesEvent();
}

class GetTagGamesEvent extends TagGamesEvent {
  final List<int> ids;

  const GetTagGamesEvent({required this.ids});

  @override
  List<Object?> get props => [ids];
}
