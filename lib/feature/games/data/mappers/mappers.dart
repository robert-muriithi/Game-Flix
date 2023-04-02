import 'package:game_flix_flutter/feature/games/data/datasources/local/entity/favorites/favorites_entity.dart';

import '../datasources/local/entity/game/game_entity.dart';
import '../model/games_response.dart';
import '../../domain/model/game.dart';
import '../../domain/model/game_deatils.dart';
import '../datasources/local/entity/games_details/games_details.dart';
import '../model/game_details_response.dart';


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
      metaCritic: results.metaCritic ?? 0
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

GameResults toFavoriteEntityFromDomain(FavoriteEntity entity){
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
      metaCritic: entity.metaCritic
  );
}

FavoriteEntity fromFavoriteEntityToDomain(GameResults results){
  return FavoriteEntity(
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
      metaCritic: results.metaCritic!,
      genres: results.genres!,
      esrbRating: results.esrbRating!,
      platforms: results.platforms!,
      shortScreenshots: results.shortScreenshots!,
      tags: results.tags!
  );
}



GameDetailsEntity fromGameDetailsResponseToEntity(GameDetailsResponse response){
  return GameDetailsEntity(
    id: response.id,
    name: response.name,
    backgroundImage: response.backgroundImage!,
    backgroundImageAdditional: response.backgroundImageAdditional ?? '',
    developers: response.developers!,
    descriptionRaw: response.descriptionRaw!,
    description: response.description!,
    website: response.website!,
    creatorsCount: response.creatorsCount!
  );
}

GameDetails fromGameDetailsEntityToDomain(GameDetailsEntity entity){
  return GameDetails(
      id: entity.id,
      name: entity.name,
      backgroundImage: entity.backgroundImage,
      backgroundImageAdditional: entity.backgroundImageAdditional,
      developers: entity.developers,
      descriptionRaw: entity.descriptionRaw,
      description: entity.description,
      website: entity.website,
      creatorsCount: entity.creatorsCount
  );
}

GamesResultsEntity fromDomainToEntity(GameResults gameResults){
  return GamesResultsEntity(
      id: gameResults.id!,
      name: gameResults.name!,
      released: gameResults.released!,
      backgroundImage: gameResults.backgroundImage,
      rating: gameResults.rating!,
      ratingsCount: gameResults.ratingsCount!,
      reviewsTextCount: gameResults.reviewsTextCount!,
      suggestionsCount: gameResults.suggestionsCount!,
      updated: gameResults.updated!,
      reviewsCount: gameResults.reviewsCount!,
      platforms: gameResults.platforms!,
      genres: gameResults.genres!,
      esrbRating: gameResults.esrbRating!,
      shortScreenshots: gameResults.shortScreenshots!,
      tags: gameResults.tags!,
      metaCritic: gameResults.metaCritic!
  );
}






