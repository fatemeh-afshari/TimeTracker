import 'package:sealed_annotations/sealed_annotations.dart';

part 'list_event.sealed.dart';

@Sealed()
@WithEquality(Equality.distinct)
@WithWrap()
abstract class _ListEvent {
  void addTask();
}
