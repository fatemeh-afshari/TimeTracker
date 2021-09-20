import 'package:flutter/material.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_bloc.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_event.dart';
import 'package:time_tracker/src/model/task_model.dart';

class ListItem extends StatelessWidget {
  final TaskModel item;

  const ListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
          child: ListTile(
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: ()=>_deleteItem(context),
            ),
            title: Text(item.title),
            subtitle: Text(
              '${item.createdTime.month}-${item.createdTime.day}-${item.createdTime.year}  ${item.createdTime.hour}:${item.createdTime.minute}',
            ),
          ),
        ),
      ),
    );
  }

  void _deleteItem(BuildContext context) {
    ListBloc.of(context).add(ListEvent.deleteItem(item.id));
  }
}
