import 'package:flutter/material.dart';
import 'package:time_tracker/src/feature/detail/detail_page.dart';
import 'package:time_tracker/src/feature/list/list_page.dart';
import 'package:time_tracker/src/route/route_names.dart';

class CustomRouter {
  // ignore: missing_return
  static Route<dynamic>? allRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.listRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ListPage(),
        );
      case RouteNames.detailRoute:
        return MaterialPageRoute(
          builder: (_) => DetailPage(),
          settings: settings,
        );
    }
    //TODO unknown route
  }
}