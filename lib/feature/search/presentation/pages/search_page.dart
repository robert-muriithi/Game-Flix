import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/widgets/loading/loading.dart';
import '../../../../injector.dart';
import '../../../categories/presentation/widgets/error_widget.dart';
import '../../domain/model/search_results_model.dart';
import '../blocs/search_bloc/search_bloc.dart';
import '../widgets/search_list_widget.dart';

class SearchDelegatePage extends SearchDelegate {
  List<SearchResultsModel> results = [];
  BuildContext? blocContext;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSuggestions(context);
  }

  BlocProvider<SearchBloc> _buildResults(BuildContext context){
    return BlocProvider(
        create: (_) => sl<SearchBloc>(),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            blocContext = context;
            if(state is SearchInitialState){
              dispatchSearchEvent(context, query);
            }
            if(state is SearchLoadingState){
              return  const Center(
                  child: LoadingWidget());
            }
            else if(state is SearchLoadedState){
              final results = state.results;
              this.results = results;
              return SearchListWidget(results: this.results);
            }
            else if(state is SearchErrorState){
              return ErrorMessageWidget(message: state.message);
            }else {
              return const ErrorMessageWidget(message: 'An unknown error occurred');
            }

          },
        )
    );
  }

  void dispatchSearchEvent(BuildContext context, String query) {
    BlocProvider.of<SearchBloc>(context).add(SearchEventStarted(query: query));
  }

  Widget _buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: const Icon(Icons.games_outlined),
        title: RichText(
          text: TextSpan(
            text: results[index].name.substring(0, query.length),
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: results[index].name.substring(query.length),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      itemCount: results.length,
    );
  }







  /*final List<String> listExample;

  SearchDelegatePage(this.listExample);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? listExample
        : listExample
            .where((element) => element.toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: const Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }*/
}
