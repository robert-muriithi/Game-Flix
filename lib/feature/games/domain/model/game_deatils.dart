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
      this.descriptionRaw});

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
        released
      ];
}

class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({ required this.id,  required this.name});

  @override
  List<Object?> get props => [id, name];

}
class Developers extends Equatable {
  final int id;
  final String name;
  final int gamesCount;
  final String imageBackground;

  const Developers({required this.id, required this.name,required this.gamesCount, required this.imageBackground});

  @override
  List<Object?> get props => [id, name, gamesCount, imageBackground];
}
