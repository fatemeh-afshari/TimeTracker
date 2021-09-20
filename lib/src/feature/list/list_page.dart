import 'package:flutter/material.dart';
import 'package:time_tracker/src/widget/pop_up.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const AddTaskPopUp(),
          );
        },
      ),
      body: Center(
        child: Text('list'),
      ),
    );
  }
}
