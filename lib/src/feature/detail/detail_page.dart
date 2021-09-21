import 'package:flutter/material.dart';
import 'package:time_tracker/generated/l10n.dart';
import 'package:time_tracker/src/model/task_model.dart';
import 'package:time_tracker/src/theme/dimen.dart';
import 'package:time_tracker/src/config/extension.dart';

class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final model =ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(appBar: AppBar(title: Text(model.title),centerTitle: true,),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text(S.of(context).project_name),
          const SizedBox(height: Dimen.defaultMargin),
          Text(model.project),
          const SizedBox(height: Dimen.defaultMargin),
          Text(S.of(context).description),
          const SizedBox(height: Dimen.defaultMargin),
          Text(model.description),
          const SizedBox(height: Dimen.defaultMargin),
          Text(S.of(context).start_time),
          const SizedBox(height: Dimen.defaultMargin),
          Text(model.startedTime==null?S.of(context).not_started:model.startedTime!.dateTimeToString),
          const SizedBox(height: Dimen.defaultMargin),
          Text(S.of(context).finish_time),
          const SizedBox(height: Dimen.defaultMargin),
          Text(model.finishedTime==null?S.of(context).not_finished:model.finishedTime!.dateTimeToString),
          const SizedBox(height: Dimen.defaultMargin),
        ],),
      ),);
  }

}