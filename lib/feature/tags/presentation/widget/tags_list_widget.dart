import 'package:flutter/material.dart';
import 'package:game_flix_flutter/feature/tags/presentation/widget/tag_item_widget.dart';

import '../../domain/model/tag.dart';

class TagsListWidget extends StatelessWidget {
  final List<TagResult> tags;
  const TagsListWidget({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: tags.length,
            itemBuilder: (context, index) {
              return TagItemWidget(tag: tags[index]);
            },
          ),
        ),
      ],
    );
  }
}
