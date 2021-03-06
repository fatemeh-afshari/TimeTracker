import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:time_tracker/generated/l10n.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_bloc.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_event.dart';
import 'package:time_tracker/src/model/task_model.dart';
import 'package:time_tracker/src/route/route_names.dart';
import 'package:time_tracker/src/config/extension.dart';

class ListItem extends StatelessWidget {
  final TaskModel item;

  const ListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>_navigate(context , item),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            closeOnScroll: true,
            secondaryActions: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: IconSlideAction(
                  closeOnTap: true,
                  caption: item.startedTime != null&&item.finishedTime == null ? S.of(context).finish : S.of(context).start,
                  color: item.startedTime != null&&item.finishedTime == null ? Colors.red : Colors.green,
                  iconWidget: Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                  onTap: () {
                    if (item.startedTime != null&&item.finishedTime == null) {
                      ListBloc.of(context).add(ListEvent.finishItem(item.id));
                    } else {
                      ListBloc.of(context).add(ListEvent.startItem(item.id));
                    }
                  },
                ),
              ),
            ],
            child: ListTile(
              leading: Text(
                _getText(context, item),
                style: TextStyle(color: _getColor(context, item), fontSize: 10),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteItem(context),
              ),
              title: Text(item.title),
              subtitle: Text(
                item.createdTime.dateTimeToString,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _deleteItem(BuildContext context) {
    ListBloc.of(context).add(ListEvent.deleteItem(item.id));
  }

  String _getText(BuildContext context, TaskModel model) {
    if (model.startedTime == null && model.finishedTime == null) {
      return S.of(context).not_started;
    } else if (model.startedTime != null && model.finishedTime != null) {
      return S.of(context).finished;
    } else {
      return S.of(context).started;
    }
  }

  Color _getColor(BuildContext context, TaskModel model) {
    if (model.startedTime == null && model.finishedTime == null) {
      return Colors.blueGrey;
    } else if (model.startedTime != null && model.finishedTime != null) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  _navigate(BuildContext context,TaskModel model) {
    Navigator.of(context).pushNamed(RouteNames.detailRoute , arguments: model);
  }
}
