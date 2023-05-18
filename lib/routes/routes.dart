import 'package:flutter/material.dart';

import '../main.dart';
import '../ui/home/home.dart';

class GenerateRoutes {
  static MaterialPageRoute _goTo(Widget screen, settings) =>
      MaterialPageRoute(settings: settings, builder: (context) => screen);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, dynamic>? args =
        settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      default:
        return _goTo(const MyHomePage(), settings);
    }
  }
}
