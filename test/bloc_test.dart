import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_bloc.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_state.dart';
import 'package:time_tracker/src/data/persistance/local_data_source.dart';
import 'package:mockito/mockito.dart';
class MockLocalDataSource extends Mock
    implements LocalDataSource {}
void main() {
  ListBloc bloc;
  LocalDataSource local;

  test('initialState should be Empty', () {
    local = MockLocalDataSource();

    bloc = ListBloc(
        local: local
    );
    // assert
    expect(bloc.state, equals(ListStateEmpty));
  });
}