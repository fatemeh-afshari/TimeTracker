import 'package:get_it/get_it.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_bloc.dart';
import 'package:time_tracker/src/config/path_provider.dart';
import 'package:time_tracker/src/data/persistance/local_data_source.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  getIt.registerLazySingleton(() => PathProvider());
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSource(pathProvider: getIt()));
  getIt.registerFactory(() => ListBloc(local: getIt()));
}
T inject<T extends Object>() {
  return getIt.get<T>();
}