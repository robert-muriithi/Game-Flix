import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading/loading.dart';
import '../../../../injector.dart';
import '../../../categories/presentation/widgets/error_widget.dart';
import '../../domain/model/search_results_model.dart';
import '../blocs/search_details_bloc/search_result_bloc.dart';
import '../widgets/search_result_game_widget.dart';

class SearchResultDetailsPage extends StatelessWidget {
  final SearchResultsModel result;
  SearchResultDetailsPage({Key? key, required this.result}) : super(key: key);
  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<SearchResultBloc> _buildBody(BuildContext context){
    return BlocProvider(
        create: (_) => sl<SearchResultBloc>(),
        child: BlocBuilder<SearchResultBloc, SearchResultState>(
          builder: (context, state){
            blocContext = context;
            if(state is SearchResultInitialState){
              dispatchGetGameDetailsEvent(context);
            }
            if(state is SearchResultsDetailsLoadingState){
              return const Center(child: LoadingWidget());
            } else if(state is SearchResultsDetailsLoadedState){
              final game = state.gameDetails;
              return SearchResultGameWidget(game: game, result: result);
            }else if(state is SearchResultsDetailsErrorState){
              return ErrorMessageWidget(message: state.message);
            }else {
              return const ErrorMessageWidget(message: 'An unknown error occurred');
            }
          },
        )
    );
  }

  void dispatchGetGameDetailsEvent(BuildContext context){
    BlocProvider.of<SearchResultBloc>(context).add(GetGameDetailsEvent(id: result.id));
  }
}
