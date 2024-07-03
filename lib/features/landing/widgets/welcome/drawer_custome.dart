import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_resume_app/features/theme_changer/presentation/bloc/theme_changer_bloc.dart';

class DrawerCustome extends StatefulWidget {
  final PageController pageController;
  const DrawerCustome({super.key, required this.pageController});

  @override
  State<DrawerCustome> createState() => _DrawerCustomeState();
}

class _DrawerCustomeState extends State<DrawerCustome> {
  bool isDay = true;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Drawer(
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate.fixed([
              BlocBuilder<ThemeChangerBloc, ThemeChangerState>(
                builder: (context, state) {
                  return SwitchListTile(
                      title: const Text('Theme Mode Day'),
                      value: state.stateEnum == ThemeChangetStateEnum.day,
                      onChanged: (value) {
                        setState(() {
                          isDay = value;
                        });
                        if (value) {
                          context
                              .read<ThemeChangerBloc>()
                              .add(ThemeToDayEvent());
                        } else {
                          context
                              .read<ThemeChangerBloc>()
                              .add(ThemeToNightEvent());
                        }
                      });
                },
              ),
              ListTile(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  widget.pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                title: const Text('Home'),
              ),
              ListTile(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  widget.pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                title: const Text('About me'),
              ),
              ListTile(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  widget.pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                title: const Text('Works'),
              ),
              ListTile(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  widget.pageController.animateToPage(3,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                title: const Text('Projects'),
              )
            ])),
          ],
        ),
      ),
    );
  }
}
