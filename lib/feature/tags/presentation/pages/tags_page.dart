import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector.dart';
import '../../domain/model/tag.dart';
import '../bloc/games/tag_games_bloc.dart';
import '../bloc/tags/tags_bloc.dart';
import '../widget/tags_list_widget.dart';

class TagsPage extends StatelessWidget {
  TagsPage({Key? key}) : super(key: key);

  BuildContext? _blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  MultiBlocProvider _buildBody(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<TagsBloc>()),
        BlocProvider(create: (_) => sl<TagGamesBloc>()),
      ],
      child: BlocBuilder<TagsBloc, TagsState>(
        builder: (context, state) {
          _blocContext = context;
          if (state is TagsInitialState) {
            dispatchGetTagsEvent(context);
          } else if (state is TagsLoadedState) {
            return _buildTagsList(state.tags);
          } else if (state is TagsErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text('Unknown state'),
            );
          }
          return BlocBuilder<TagGamesBloc, TagGamesState>(
            builder: (context, state) {
              _blocContext = context;
              if (state is TagGamesInitialState) {
                dispatchGetTagGamesEvent(context);
              }
              if (state is TagGamesLoadingState) {
                return const Center(child: LoadingWidget());
              } else if (state is TagGamesLoadedState) {
                final tagGames = state.tagGames;
                return GameDetailsWidget(
                  gameDetails: gameDetails,
                  isFavorite: isFavorite,
                  onFavoritePressed: () {
                    dispatchFavoriteGameEvent(blocContext!, game);
                  },
                );
              } else if (state is TagGamesErrorState) {
                return ErrorWidget(
                  message: state.message,
                  onRetryPressed: () {
                    dispatchGetGameDetailsEvent(blocContext!);
                  },
                );
              } else {
                return ErrorWidget(
                  message: 'Unknown state',
                  onRetryPressed: () {
                    dispatchGetGameDetailsEvent(blocContext!);
                  },
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildTagsList(List<TagResult> tags) {
    return TagsListWidget(tags: tags);
  }

  void dispatchGetTagsEvent(BuildContext context) {
    BlocProvider.of<TagsBloc>(context).add(GetTagsEvent());
  }
}
