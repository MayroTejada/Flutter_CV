import 'package:flutter/material.dart';
import 'package:my_resume_app/features/landing/views/home_page.dart';

import 'core/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: MaterialTheme.lightScheme().toColorScheme()),
      home: const HomePage(),
    );
  }
}
