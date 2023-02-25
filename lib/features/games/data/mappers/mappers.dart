import 'package:game_flix_flutter/features/games/data/datasources/local/entity/game/game_entity.dart';
import 'package:game_flix_flutter/features/games/data/model/games_response.dart';
import 'package:game_flix_flutter/features/games/domain/model/game.dart';


GamesResultsEntity fromResultResponseToEntity(Results results){
  return GamesResultsEntity(
      id: results.id!,
      name: results.name!,
      released: results.released!,
      backgroundImage: results.backgroundImage,
      rating: results.rating!,
      ratingsCount: results.ratingsCount!,
      reviewsTextCount: results.reviewsTextCount!,
      suggestionsCount: results.suggestionsCount!,
      updated: results.updated!,
      reviewsCount: results.reviewsCount!,
      platforms: results.platforms!,
      genres: results.genres!,
      esrbRating: results.esrbRating ?? PlatformResult(id: 0, name: 'Not Rated', imageBackground: '', gamesCount: 0),
      shortScreenshots: results.shortScreenshots!,
      tags: results.tags!,
      metaCritic: results.metaCritic!
  );
}

GameResults fromEntityToDomain(GamesResultsEntity entity){
  return GameResults(
      id: entity.id,
      name: entity.name,
      released: entity.released,
      backgroundImage: entity.backgroundImage,
      rating: entity.rating,
      ratingsCount: entity.ratingsCount,
      reviewsTextCount: entity.reviewsTextCount,
      suggestionsCount: entity.suggestionsCount,
      updated: entity.updated,
      reviewsCount: entity.reviewsCount,
      platforms: entity.platforms,
      genres: entity.genres,
      esrbRating: entity.esrbRating,
      shortScreenshots: entity.shortScreenshots,
      tags: entity.tags,
      metaCritic: entity.metaCritic
  );
}




