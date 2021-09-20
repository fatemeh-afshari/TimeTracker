import 'package:sealed_annotations/sealed_annotations.dart';
import 'package:time_tracker/src/model/task_model.dart';
part 'list_state.sealed.dart';

@Sealed()
@WithEquality(Equality.distinct)
@WithWrap()
abstract class _ListState {
  void empty();
  void added(List<TaskModel> list);
}
