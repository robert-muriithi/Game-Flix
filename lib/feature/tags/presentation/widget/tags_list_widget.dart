import 'package:flutter/material.dart';
import 'package:game_flix_flutter/feature/tags/presentation/widget/tag_item_widget.dart';


import '../../../games/domain/model/game_deatils.dart';
import '../../domain/model/tag.dart';

class TagsListWidget extends StatelessWidget {
  final List<TagResult> tags;
  final List<GameDetails> tagGames;
  const TagsListWidget({Key? key, required this.tags, required this.tagGames}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: tags.length,
        itemBuilder: (context, index) {

          /*for(var i in tags[index].games!){
            for(var j in tagGames){
              if(i.id == j.id){
                _tagGames.add(j);
              }
            }
          }*/
          /*this.tagGames.where((element) => tagGames.contains(element.id)).toList() */

          final tagGames = tags[index].games?.map((e) => e.id).toList();
          return TagItemWidget(
            tag: tags[index],
            //Get the games that have same is as the tag games
           tagGames: tagGames != null
               ?  tagGames.map((e) => this.tagGames.firstWhere((element) => element.id == e)).toList()
               : [],
          );
        },
    );
  }
}
