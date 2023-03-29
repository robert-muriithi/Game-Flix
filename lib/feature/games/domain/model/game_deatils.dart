import 'package:equatable/equatable.dart';

class GameDetails extends Equatable {
  final int id;
  final String name;
  final String? description;
  final String? backgroundImage;
  final String? backgroundImageAdditional;
  final String? website;
  final int? creatorsCount;
  final List<Developers>? developers;
  final String? descriptionRaw;
  final int? metacritic;
  final String? released;
  final List<Genres>? genres;
 /* final List<GamePlatformsResults>? platforms;*/
  /*final List<ShortScreenShots>? screenShots;*/

  const GameDetails(
      {required this.id,
      required this.name,
      this.description,
      this.backgroundImage,
      this.backgroundImageAdditional,
      this.website,
      this.creatorsCount,
      this.developers,
      this.metacritic,
      this.released,
        this.genres,
      this.descriptionRaw,
        /*this.platforms,*/
        /*this.screenShots,*/
      });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        backgroundImage,
        backgroundImageAdditional,
        website,
        creatorsCount,
        developers,
        descriptionRaw,
        metacritic,
        released,
      /* platforms*/
        /*screenShots*/
      ];
}

class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({ required this.id,  required this.name});

  @override
  List<Object?> get props => [id, name];

}

/*
class GamePlatformsResults extends Equatable {
  GamePlatformResult? platform;
  String? releasedAt;

  GamePlatformsResults({this.platform, this.releasedAt});

  @override
  List<Object?> get props => [platform, releasedAt];

  @override
  bool get stringify => true;
}

class GamePlatformResult extends Equatable {
  int? id;
  String? name;
  String? image;
  int? gamesCount;
  String? imageBackground;

  GamePlatformResult({
    this.id,
    this.name,
    this.image,
    this.gamesCount,
    this.imageBackground,
  });

  @override
  List<Object?> get props => [id, name, image, gamesCount, imageBackground];

  @override
  bool get stringify => true;
}

*/

class Developers extends Equatable {
  final int id;
  final String name;
  final int gamesCount;
  final String imageBackground;

  const Developers({required this.id, required this.name,required this.gamesCount, required this.imageBackground});

  @override
  List<Object?> get props => [id, name, gamesCount, imageBackground];
}

class ShortScreenShots extends Equatable {
  final String image;
  const ShortScreenShots({required this.image});

  @override
  List<Object?> get props => [image];
}
