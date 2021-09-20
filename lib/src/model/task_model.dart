import 'package:objectbox/objectbox.dart';


@Entity()
class TaskModel {
  int id;

  String title;
  String project;

  String description;
  DateTime createdTime;

  DateTime? startedTime;

  DateTime? finishedTime;

  TaskModel({
    this.id = 0,
    required this.title,
    required this.project,
    required this.description,
    required this.createdTime,
    this.startedTime,
    this.finishedTime,
  });
}
