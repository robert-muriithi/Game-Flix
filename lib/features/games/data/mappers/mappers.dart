import 'package:game_flix_flutter/features/categories/data/model/genres_response.dart';
import 'package:game_flix_flutter/features/categories/domain/model/genre.dart';

import '../../../categories/data/datasources/local/entity/genre/genres_entity.dart';
import '../../domain/model/game.dart';
import '../datasources/local/entity/game/game_entity.dart';
import '../model/games_response.dart';

GamesEntity toEntity(GameResponse response) {
  return GamesEntity(
      id: response.id,
      name: response.name,
      backgroundImage: response.backgroundImage);
}

GameResponse toResponse(GamesEntity entity) {
  return GameResponse(
      id: entity.id,
      name: entity.name,
      backgroundImage: entity.backgroundImage);
}

Game toGame(GamesEntity entity) {
  return Game(
      id: entity.id,
      name: entity.name,
      backgroundImage: entity.backgroundImage
  );
}




