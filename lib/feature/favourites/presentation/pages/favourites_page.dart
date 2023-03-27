import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_flix_flutter/feature/categories/presentation/widgets/error_widget.dart';
import '../../../../injector.dart';
import '../bloc/favs_bloc.dart';
import '../widets/favs_list_widget.dart';

class FavouritesPage extends StatelessWidget {
   FavouritesPage({Key? key}) : super(key: key);
  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: _buildBody(context),
    );
  }

  BlocProvider<FavsBloc> _buildBody(BuildContext context){
    return BlocProvider(
        create: (_) => sl<FavsBloc>(),
        child: BlocBuilder<FavsBloc, FavsState>(
          builder: (context, state){
            blocContext = context;
            if(state is FavsInitial){
              dispatchGetFavsEvent(context);
            }
             if(state is FavsLoadedState){
              return FavsListWidget(
                  favs: state.games,
                  onRemove: (id) {
                    context.read<FavsBloc>().add(RemoveFavEvent(id:id));
                    //BlocProvider.of<FavsBloc>(context).add(RemoveFavEvent(id:id));
                  },
              );
            } else if(state is FavsErrorState){
              return ErrorMessageWidget(message: state.message);
            } else if(state is FavRemovedState) {
              dispatchUpdateListEvent(context, state.isRemoved);
              return  Container();
             }
             else if(state is FavsEmptyState){
               return ErrorMessageWidget(message: state.message);
             }else {
               return Container();
             }
          },
        ),
    );

  }

  void dispatchGetFavsEvent(BuildContext context){
    BlocProvider.of<FavsBloc>(context).add(GetFavsEvent());
  }

  void dispatchUpdateListEvent(BuildContext context, bool isRemoved){
    if(isRemoved){
      BlocProvider.of<FavsBloc>(context).add(GetFavsEvent());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occurred while removing the game from favourites')));
    }
  }



}
