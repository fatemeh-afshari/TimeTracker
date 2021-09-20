import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/src/app/time_tracker_app.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_bloc.dart';
import 'package:time_tracker/src/data/persistance/local_data_source.dart';
import 'src/di/injection_container.dart' as di;
import 'src/di/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final dataSource = di.inject<LocalDataSource>();
  await dataSource.init();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<ListBloc>(
          create: (_) => getIt<ListBloc>(),
        ),
      ],
      child: TimeTrackerApp()));
}

