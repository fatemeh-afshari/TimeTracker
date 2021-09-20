import 'package:time_tracker/src/config/constants.dart';
import 'package:time_tracker/src/config/path_provider.dart';
import 'package:time_tracker/src/model/task_model.dart';

import '../../../objectbox.g.dart';

class LocalDataSource {
  late Store store;

  PathProvider pathProvider;

  late Box<TaskModel> taskModelBox;

  LocalDataSource({required this.pathProvider});

  Future<void> init() async {
    final path = await pathProvider.getFullDirectory(DATABASE_NAME);
    store = Store(getObjectBoxModel(), directory: path);
    taskModelBox = store.box<TaskModel>();
  }

  int addTask(TaskModel task) {
    return taskModelBox.put(task);
  }
  bool removeTask(TaskModel task){
    return taskModelBox.remove(task.id);
  }
  List<TaskModel> getList() {
    return taskModelBox.getAll();
  }
}


