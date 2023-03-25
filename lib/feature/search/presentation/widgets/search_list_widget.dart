import 'package:flutter/material.dart';
import 'package:game_flix_flutter/feature/search/presentation/widgets/search_item_widget.dart';
import '../../domain/model/search_results_model.dart';

class SearchListWidget extends StatelessWidget {
  final List<SearchResultsModel> results;
  const SearchListWidget({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return SearchItemWidget(result: result);
      },
    );
  }
}



