
import '../../domain/model/game.dart';
import '../datasources/local/entity/game_entity.dart';
import '../model/games_response.dart';

GameEntity toEntity(GameResponse response){
  return GameEntity(
      id: response.id,
      name: response.name,
      backgroundImage: response.backgroundImage
  );
}

GameResponse toResponse(GameEntity entity){
  return GameResponse(
      id: entity.id,
      name: entity.name,
      backgroundImage: entity.backgroundImage
  );
}

Game toGame(GameEntity entity){
  return Game(
    id: entity.id,
    name: entity.name,
    backgroundImage: entity.backgroundImage
  );
}