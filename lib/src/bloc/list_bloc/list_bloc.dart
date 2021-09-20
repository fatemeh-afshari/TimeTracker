import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_event.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_state.dart';
import 'package:time_tracker/src/data/persistance/local_data_source.dart';
import 'package:time_tracker/src/model/task_model.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  factory ListBloc.of(BuildContext context) => BlocProvider.of<ListBloc>(context);
  final LocalDataSource local;

  ListBloc({
    required this.local,
  }) : super(ListState.empty());

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    yield* event.when(
      addTask: _add,
      getList: _getList,
      deleteItem: _removeItem,
      finishItem: _finish,
      startItem: _start,
    );
  }

  Stream<ListState> _add(title, project, desc) async* {
    final task = TaskModel(title: title, project: project, description: desc, createdTime: DateTime.now(),);
    local.addTask(task);
    final list = local.getList();
    yield ListState.listUpdated(list);
  }

  Stream<ListState> _start(int id) async* {
    local.startItem(id);
    final list = local.getList();
    yield ListState.listUpdated(list);
  }

  Stream<ListState> _finish(int id) async* {
    local.finishItem(id);
    final list = local.getList();
    yield ListState.listUpdated(list);
  }

  Stream<ListState> _removeItem(id) async* {
    local.removeTask(id);
    final list = local.getList();
    yield ListState.listUpdated(list);
  }

  Stream<ListState> _getList() async* {
    final list = local.getList();
    yield ListState.listUpdated(list);
  }
  @override
  Future<void> close() {
    local.dispose();
    return super.close();
  }
}
