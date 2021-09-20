

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_event.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_state.dart';
import 'package:time_tracker/src/data/persistance/local_data_source.dart';
import 'package:time_tracker/src/model/task_model.dart';

class ListBloc extends Bloc<ListEvent, ListState>  {
  factory ListBloc.of(BuildContext context) =>
      BlocProvider.of<ListBloc>(context);
  final LocalDataSource local;
  ListBloc({
    required this.local,
  }) : super(ListState.empty());

  @override
  Stream<ListState> mapEventToState(ListEvent event) async*{
    yield* event.when(addTask: (title , project , desc) async*{
      final task = TaskModel(title: title, project: project, description: desc, createdTime: DateTime.now());
      local.addTask(task);
      final list =local.getList();
      yield ListState.added(list);
    }, getList: () async*{
      final list =local.getList();
      yield ListState.listUpdated(list);
    }, deleteItem: ( id) async*{
      local.removeTask(id);
      final list =local.getList();
      yield ListState.listUpdated(list);
    });
  }

}
