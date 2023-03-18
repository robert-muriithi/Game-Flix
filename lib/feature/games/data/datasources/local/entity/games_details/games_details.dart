import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';

import '../../../../../domain/model/game_deatils.dart';

@Entity(tableName: Constants.kGameDetailsTable)
class GameDetailsEntity extends Equatable {
  @primaryKey final int id;
  final String name;
  final String description;
  final String backgroundImage;
  final String backgroundImageAdditional;
  final String website;
  final int creatorsCount;
  final String descriptionRaw;
  final List<Developers> developers;

  const GameDetailsEntity({
    required this.id,
    required this.name,
    required  this.developers,
    required this.description,
    required this.descriptionRaw,
    required this.backgroundImageAdditional,
    required this.backgroundImage,
    required this.website,
    required this.creatorsCount,
  });

  @override

  List<Object?> get props => [
    id,
    name,
    description,
    descriptionRaw,
    backgroundImage,
    backgroundImageAdditional,
    website,
    creatorsCount,
    developers
  ];

}