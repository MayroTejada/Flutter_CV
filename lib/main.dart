import 'package:flutter/material.dart';
import 'package:my_resume_app/core/router/app_router.dart';

import 'core/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Mario Tejada',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: MaterialTheme.lightScheme().toColorScheme()),
    );
  }
}
