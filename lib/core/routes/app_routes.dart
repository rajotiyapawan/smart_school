import 'package:flutter/material.dart';
import 'package:smart_school/src/dashboard/dashboard.dart';
import 'package:smart_school/src/profile/presentation/views/profile_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => DashboardScreen(),
    profile: (context) => ProfileScreen(),
  };
}
