import 'package:game_flix_flutter/features/games/data/datasources/local/entity/genre/genres_entity.dart';
import 'package:game_flix_flutter/features/games/data/model/genres_response.dart';
import 'package:game_flix_flutter/features/games/domain/model/genre.dart';

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


GenresResults fromResultResponseToEntity(ResultsResponse response) {
  return GenresResults(
     id: response.id,
     name: response.name,
      gamesCount: response.gamesCount,
      backgroundImage: response.backgroundImage,
       game: response.game!.map((e) => fromGamesResponseToEntityGames(
           GamesResponse(id: e!.id, name: e.name))).toList()
  );
}

GenresGames fromGamesResponseToEntityGames(GamesResponse response) {
  return GenresGames(
     id: response.id,
     name: response.name,
  );
}

Results fromEntityToDomainResults(GenresResults entity ){
  return Results(
    id: entity.id,
    name: entity.name,
    gamesCount: entity.gamesCount,
    backgroundImage: entity.backgroundImage,
    game: entity.game.map((e) => fromEntityToDomainGames(
        GenresGames(id: e.id, name: e.name)
    )).toList()
  );
}

Games fromEntityToDomainGames(GenresGames entity ){
  return Games(
    id: entity.id,
    name: entity.name,
  );
}


