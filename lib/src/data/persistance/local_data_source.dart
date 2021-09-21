import 'package:time_tracker/src/config/constants.dart';
import 'package:time_tracker/src/config/path_provider.dart';
import 'package:time_tracker/src/model/task_model.dart';

import '../../../objectbox.g.dart';

abstract class LocalDataSource {
  factory LocalDataSource({
    required PathProvider pathProvider,
  }) = LocalDataSourceImpl;

  Future<void> init();
  int addTask(TaskModel task);
  bool removeTask(int id);
  List<TaskModel> getList();
  void finishItem(int id);
  void startItem(int id);
  void dispose();
}

class LocalDataSourceImpl implements LocalDataSource {
  PathProvider pathProvider;
  late Store store;
  late Box<TaskModel> taskModelBox;

  LocalDataSourceImpl({required this.pathProvider});

  @override
  Future<void> init() async {
    final path = await pathProvider.getFullDirectory(DATABASE_NAME);
    store = Store(getObjectBoxModel(), directory: path);
    taskModelBox = store.box<TaskModel>();
  }
  @override
  int addTask(TaskModel task) {
    return taskModelBox.put(task);
  }
  @override
  bool removeTask(int id) {
    return taskModelBox.remove(id);
  }
  @override
  List<TaskModel> getList() {
    return taskModelBox.getAll();
  }
  @override
  void finishItem(int id) {
    var model = taskModelBox.get(id);
    model!.finishedTime = DateTime.now();
    taskModelBox.put(model);
  }
  @override
  void startItem(int id) {
    var model = taskModelBox.get(id);
    model!.startedTime = DateTime.now();
    model.finishedTime = null;
    taskModelBox.put(model);
  }
  @override
  void dispose() {
    store.close();
  }
}
