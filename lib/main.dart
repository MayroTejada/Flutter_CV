import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_resume_app/core/router/app_router.dart';
import 'package:my_resume_app/features/theme_changer/presentation/bloc/theme_changer_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return BlocProvider<ThemeChangerBloc>(
      create: (context) => ThemeChangerBloc(),
      child: BlocBuilder<ThemeChangerBloc, ThemeChangerState>(
        builder: (context, state) {
          return MaterialApp.router(
              routerConfig: appRouter.config(),
              title: 'Mario Tejada',
              debugShowCheckedModeBanner: false,
              theme: state.themeData);
        },
      ),
    );
  }
}
