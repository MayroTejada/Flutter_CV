import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/features/landing/views/about_me_section.dart';
import 'package:my_resume_app/features/landing/views/projects_section.dart';
import 'package:my_resume_app/features/landing/views/welcome_section.dart';
import 'package:my_resume_app/features/landing/views/works_section.dart';
import 'package:my_resume_app/features/landing/widgets/welcome/app_bar_content.dart';
import 'package:my_resume_app/features/landing/widgets/welcome/drawer_custome.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  num page = 0;
  late PageController pageController;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    pageController = PageController(initialPage: 2);
    pageController.addListener(() {
      setState(() {
        page = pageController.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustome(
        pageController: pageController,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              controller: _scrollController,
              slivers: [
                AppBarContent(
                  currentPage: page,
                  pageController: pageController,
                ),
                SliverFillRemaining(
                  child: PageView(
                    onPageChanged: (value) {
                      page = value;
                    },
                    controller: pageController,
                    scrollDirection: Axis.vertical,
                    children: const [
                      WelcomeSection(),
                      AboutMeSection(),
                      WorkSection(),
                      ProjectsSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
              bottom: 50,
              left: MediaQuery.of(context).size.width / 12,
              duration: const Duration(milliseconds: 400),
              child: IconButton(
                style: ButtonStyle(
                    shadowColor: const WidgetStatePropertyAll(Colors.grey),
                    elevation: const WidgetStatePropertyAll(2),
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).scaffoldBackgroundColor)),
                onPressed: () {
                  if (page < 3) {
                    pageController.animateToPage(page.toInt() + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  }
                },
                icon: Icon(
                  Icons.arrow_downward,
                  color: Theme.of(context).primaryColor,
                ),
              )),
        ],
      ),
    );
  }
}
