import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../core/widgets/loading/loading.dart';
import '../../../../injector.dart';
import '../../../categories/presentation/widgets/error_widget.dart';
import '../../domain/model/tag.dart';
import '../bloc/games/tag_games_bloc.dart';
import '../bloc/tags/tags_bloc.dart';
import '../widget/tags_list_widget.dart';

class TagsPage extends StatelessWidget {
  TagsPage({Key? key}) : super(key: key);

  BuildContext? blocContext;
  List<int> ids = [];
  List<TagResult> tags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  MultiBlocProvider _buildBody(BuildContext context) {
    final log = Logger();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<TagsBloc>()),
        BlocProvider(create: (_) => sl<TagGamesBloc>()),
      ],
      child: BlocBuilder<TagsBloc, TagsState>(
        builder: (context, state) {
          blocContext = context;
          if (state is TagsInitialState) {
            dispatchGetTagsEvent(context);
          }
          if (state is TagsLoadedState) {
            //game ids for each tag
            tags = state.tags;
            for (var i in state.tags) {
              if (i.games != null) {
                for (var j in i.games!) {
                  ids.add(j.id);
                }
              }
            }
            return BlocBuilder<TagGamesBloc, TagGamesState>(
                builder: (context, state) {
              blocContext = context;
              if (state is TagGamesInitialState) {
                dispatchGetTagGamesEvent(context, ids: ids);
              }
              if (state is TagGamesLoadingState) {
                return const Center(child: LoadingWidget());
              } else if (state is TagGamesLoadedState) {
                final tagGames = state.games;
                return TagsListWidget(
                  tagGames: tagGames,
                  tags: tags,
                  /*onTagPressed: (tag) {
                        dispatchGetTagGamesEvent(context, tag: tag);
                      },*/
                );
              } else if (state is TagGamesErrorState) {
                return ErrorMessageWidget(
                  message: state.message,
                  /*onRetryPressed: () {
                        dispatchGetTagGamesEvent(blocContext!);
                      },*/
                );
              }
              else if (state is TagsGamesEmptyState) {
                return ErrorMessageWidget(message: state.message);
              }
              else {
                return Container();
              }
            });
          } else if (state is TagsErrorState) {
            return ErrorMessageWidget(message: state.message);
          } else if (state is TagsEmptyState) {
            return ErrorMessageWidget(message: state.message);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void dispatchGetTagsEvent(BuildContext context) {
    BlocProvider.of<TagsBloc>(context).add(GetTagsEvent());
  }

  void dispatchGetTagGamesEvent(BuildContext context,
      {required List<int> ids}) {
    BlocProvider.of<TagGamesBloc>(context).add(GetTagGamesEvent(ids: ids));
  }
}
