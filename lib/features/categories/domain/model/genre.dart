import 'package:equatable/equatable.dart';


class Results extends Equatable{
  final int id;
  final String name;
  final int gamesCount;
  final List<Games?>? game;
  final String backgroundImage;

  const Results({required this.id, required this.name, required this.gamesCount, required this.game, required this.backgroundImage});

  @override
  List<Object?> get props => [
    id,
    name,
    gamesCount,
    game,
    backgroundImage
  ];

  @override
  bool get stringify => true;
}



class Games extends Equatable {
  final int id;
  final String name;

  const Games({required this.name, required this.id});

  @override
  List<Object?> get props => [
    id,
    name,
  ];

  @override
  bool get stringify => true;

}