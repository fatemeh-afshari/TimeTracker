import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/generated/l10n.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_bloc.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_event.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_state.dart';
import 'package:time_tracker/src/model/task_model.dart';
import 'package:time_tracker/src/theme/dimen.dart';
import 'package:time_tracker/src/widget/list_item.dart';
import 'package:time_tracker/src/widget/pop_up.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    ListBloc.of(context).add(ListEvent.getList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AddTaskPopUp(),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.defaultMargin),
          child: BlocBuilder<ListBloc, ListState>(
            builder: (context, state) {
              return state.whenOrDefault(
                listUpdated: _showList,
                orDefault: Center(
                  child: Text(
                    S.of(context).empty,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _showList(List<TaskModel> list) {
    return list.isNotEmpty
        ? ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListItem(
                item: list[index],
              );
            },
            primary: true,
          )
        : Center(
            child: Text(
              S.of(context).empty,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          );
  }
}
