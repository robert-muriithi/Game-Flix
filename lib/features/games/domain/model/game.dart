import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final String id;
  final String name;
  final String backgroundImage;

 const Game({required this.name, required this.id, required this.backgroundImage}) : super();

  @override
  List<Object?> get props => [
    id,
    name,
    backgroundImage
  ];

}

