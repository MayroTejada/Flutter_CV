import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_resume_app/core/responsive/responsive_layout.dart';
import 'package:my_resume_app/core/widgets/app_bar/sliver_app_bar.dart';
import 'package:my_resume_app/core/widgets/link_button.dart';
import 'package:my_resume_app/features/theme_changer/presentation/bloc/theme_changer_bloc.dart';

class AppBarContent extends StatefulWidget {
  final num currentPage;
  final PageController pageController;

  const AppBarContent(
      {super.key, required this.pageController, this.currentPage = 0});

  @override
  State<AppBarContent> createState() => _AppBarContentState();
}

class _AppBarContentState extends State<AppBarContent> {
  bool isDay = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<CategoryItem> items = [
      CategoryItem('Home', 'route', const ValueKey(0)),
      CategoryItem('About', 'route', const ValueKey(1)),
      CategoryItem('Works', 'route', const ValueKey(2)),
      CategoryItem('Projects', 'route', const ValueKey(3)),
    ];
    return ResponsiveLayout(
      isSliver: true,
      childMobile: SliverAppBar(
        snap: true,
        elevation: 3,
        forceElevated: true,
        floating: true,
        leading: Builder(
          builder: (BuildContext context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ),
      ),
      childDesktop: SliverPersistentHeader(
        delegate: SliverAppBarDelegate(
          maxHeight: kToolbarHeight,
          minHeight: 80,
          child: Material(
            elevation: 1,
            child: Row(
              children: [
                ...items
                    .map((e) => LinkButton(
                          isSelected:
                              widget.currentPage.toInt() == e.keySection.value,
                          onCallback: () {
                            widget.pageController.animateToPage(
                                e.keySection.value,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                          },
                          text: e.name,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ))
                    .toList(),
                BlocBuilder<ThemeChangerBloc, ThemeChangerState>(
                  builder: (context, state) {
                    return Switch(
                        value: isDay,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem {
  final String name;
  final String route;
  final ValueKey<int> keySection;

  CategoryItem(this.name, this.route, this.keySection);
}
