import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading/loading.dart';
import '../../../../injector.dart';
import '../../../games/presentation/widgets/error_widget.dart';
import '../blocs/categories_bloc/categories_bloc.dart';
import '../widgets/categories_list_widget.dart';
import '../widgets/search_bar.dart';

class CategoriesPage extends StatelessWidget {
   CategoriesPage({Key? key}) : super(key: key);
  BuildContext? blocContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                delegate: SliverSearchBar(),
                pinned: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                      _buildBody(context),
                ])
            )
          ]
      ),
    );
  }



  BlocProvider<CategoriesBloc> _buildBody(BuildContext context){
    return BlocProvider(
        create: (_) => sl<CategoriesBloc>(),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            blocContext = context;

            if(state is CategoriesInitialState){
              dispatchEvent(context);
            }
            if(state is CategoriesLoadingState){
              return  const Center(
                  child: LoadingWidget());
            }
            else if(state is CategoriesLoadedState){
              final genres = state.results;
              return CategoriesListWidget(genres: genres);
            }
            else if(state is CategoriesErrorState){
              return ErrorMessageWidget(message: state.message);
            }else {
              return const ErrorMessageWidget(message: 'An unknown error occurred');
            }

          },
        )
    );
  }

  void dispatchEvent(BuildContext context){
    BlocProvider.of<CategoriesBloc>(context).add(GetCategoriesEvent());
  }



}


