import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/providers/notes_provider.dart';
import '../ui/app_navigator/app_navigator.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        initialRoute: AppNavigator.initRoute,
        routes: AppNavigator.routes,
        onGenerateRoute: AppNavigator.generate,
      ),
    );
  }
}
