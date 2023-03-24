

import 'package:equatable/equatable.dart';

class TagResult extends Equatable {
  final int id;
  final String name;
  final String language;
  final int gamesCount;
  final String imageBackground;
  final List<GameResult>? games;

  const TagResult({
    required this.id,
    required this.name,
    required this.language,
    required this.gamesCount,
    required this.imageBackground,
    required this.games,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        language,
        gamesCount,
        imageBackground,
        games,
      ];

}

class GameResult extends Equatable {
  final int id;
  const GameResult({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}