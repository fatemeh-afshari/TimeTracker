import 'package:flutter/material.dart';
import 'package:time_tracker/src/route/custom_route.dart';
import 'package:time_tracker/src/route/route_names.dart';

class TimeTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: CustomRouter.allRoute,
      initialRoute: RouteNames.listRoute,
    );
  }
}