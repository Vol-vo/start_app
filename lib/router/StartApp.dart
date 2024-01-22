import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:start_app/theme/theme.dart';
class StartApp extends StatelessWidget {
  const StartApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start App',
      theme: lightTheme,
      routes: routes,

    );
  }
}