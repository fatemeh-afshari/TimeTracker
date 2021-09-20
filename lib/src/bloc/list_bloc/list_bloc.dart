

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_event.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_state.dart';
import 'package:time_tracker/src/data/persistance/local_data_source.dart';

class ListBloc extends Bloc<ListEvent, ListState>  {
  final LocalDataSource local;
  ListBloc({
    required this.local,
  }) : super(ListState.empty());

  @override
  Stream<ListState> mapEventToState(ListEvent event) async*{
    yield* event.when(addTask: (task) async*{
      local.addTask(task);
      final list =local.getList();
      yield ListState.added(list);
    });
  }

}
