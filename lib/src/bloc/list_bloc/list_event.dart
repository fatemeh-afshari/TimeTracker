import 'package:sealed_annotations/sealed_annotations.dart';

part 'list_event.sealed.dart';

@Sealed()
@WithEquality(Equality.distinct)
@WithWrap()
abstract class _ListEvent {
  void addTask(String title , String project , String description);
  void getList();
  void deleteItem(int id);
  void startItem(int id);
  void finishItem(int id);
}
