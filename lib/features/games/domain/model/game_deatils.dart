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

  const GameDetails(
      {required this.id,
      required this.name,
      this.description,
      this.backgroundImage,
      this.backgroundImageAdditional,
      this.website,
      this.creatorsCount,
      this.developers,
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
      ];
}

class Developers extends Equatable {
  final int? id;
  final String? name;
  final int? gamesCount;
  final String? imageBackground;

  const Developers({this.id, this.name, this.gamesCount, this.imageBackground});

  @override
  List<Object?> get props => [id, name, gamesCount, imageBackground];
}
