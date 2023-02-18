import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';

@Entity(tableName: Constants.kGameTableName)
class GameEntity extends Equatable {
  @primaryKey final String id;
  final String name;
  final String backgroundImage;

  const GameEntity({required this.id, required this.name, required this.backgroundImage});

  @override
  List<Object?> get props => [
    id,
    name,
    backgroundImage
  ];

}