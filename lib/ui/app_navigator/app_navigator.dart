import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../pages/change_notes/change_notes.dart';
import '../pages/search_notes/search_notes.dart';
import '../pages/add_notes/add_notes.dart';
import '../pages/error_page/error_page.dart';
import '../pages/home_page/home_page.dart';

class AppNavigator {
  static String initRoute = AppRoutes.home;

  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.home: (_) => const HomePage(),
      AppRoutes.addNotes: (_) => const AddNotes(),
      AppRoutes.changeNotes: (_) => const ChangeNotes(),
      AppRoutes.searchNotes: (_) => const SearchNotes(),
    };
  }

  static Route generate(RouteSettings settings) {
    final set = RouteSettings(
      name: '/404',
      arguments: settings.arguments,
    );
    return MaterialPageRoute(
      settings: set,
      builder: (_) => const ErrorPage(),
    );
  }
}
