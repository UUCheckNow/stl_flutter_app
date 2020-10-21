import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stl_flutter_app/detail_page.dart';

import 'main.dart';

class RouteNames {
  static const String MAINPAGE = '/';
  static const String DETAILPAGE = '/detailPage';
}

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.DETAILPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.DETAILPAGE),
          builder: (context) => DetailPage(),
        );
      default:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.MAINPAGE),
          builder: (context) => MyHomePage(
            title: "hello",
          ),
        );
    }
  }
}
