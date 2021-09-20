import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:time_tracker/src/model/task_model.dart';

part 'list_event.sealed.dart';

@Sealed()
@WithEquality(Equality.distinct)
@WithWrap()
abstract class _ListEvent {
  void addTask(String title , String project , String description);
  void getList();
  void deleteItem(int id);
}
