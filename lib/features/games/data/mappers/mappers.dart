
import 'package:game_flix_flutter/features/games/data/datasources/local/entity/genre/genres_entity.dart';
import 'package:game_flix_flutter/features/games/data/model/genres_response.dart';
import 'package:game_flix_flutter/features/games/domain/model/genre.dart';

import '../../domain/model/game.dart';
import '../datasources/local/entity/game/game_entity.dart';
import '../model/games_response.dart';

GamesEntity toEntity(GameResponse response){
  return GamesEntity(
      id: response.id,
      name: response.name,
      backgroundImage: response.backgroundImage
  );
}

GameResponse toResponse(GamesEntity entity){
  return GameResponse(
      id: entity.id,
      name: entity.name,
      backgroundImage: entity.backgroundImage
  );
}

Game toGame(GamesEntity entity){
  return Game(
    id: entity.id,
    name: entity.name,
    backgroundImage: entity.backgroundImage
  );
}

/*Genre toGenre(GenresEntity entity){
  return Genre(

  );
}*/

GenresEntity toEntityGenre(GenreResponse response){
  return GenresEntity(
    count: response.count,
    next: response.next,
    previous: response.previous,
    results: response.results.map((e) => toEntityResults(e)).toList()
  );
}

ResultEntity toEntityResults(ResultsResponse response){
  return ResultEntity(
    id: response.id,
    name: response.name,
    gamesCount: response.gamesCount,
    backgroundImage: response.backgroundImage,
    game: response.game.map((e) => toEntityGames(e)).toList()
  );
}

GamesResponse toResponseGames(GamesEntity entity){
  return GamesResponse(
    id: entity.id,
    name: entity.name
  );
}




GameEntity toEntityGames(GamesResponse response){
  return GameEntity(
    id: response.id,
    name: response.name
  );
}

Genre toGenre(GenresEntity entity){
  return Genre(
    count: entity.count,
    next: entity.next,
    previous: entity.previous,
    results: entity.results.map((e) => toResults(e)).toList()
  );
}

Results toResults(ResultEntity entity){
  return Results(
    id: entity.id,
    name: entity.name,
    gamesCount: entity.gamesCount,
    backgroundImage: entity.backgroundImage,
    game: entity.game.map((e) => toGames(e)).toList()
  );
}

Games toGames(GameEntity entity){
  return Games(
    id: entity.id,
    name: entity.name
  );
}

