import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_resume_app/features/landing/views/about_me_section.dart';
import 'package:my_resume_app/features/landing/views/app_bar_content.dart';
import 'package:my_resume_app/features/landing/views/drawer_custome.dart';
import 'package:my_resume_app/features/landing/views/welcome_section.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _keyAboutMeSection =
      GlobalKey(debugLabel: 'section_about_me');
  final AutoScrollController _scrollController = AutoScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustome(
        scrollController: _scrollController,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              controller: _scrollController,
              slivers: [
                AppBarContent(
                  categoryKeys: const {
                    'home': ValueKey(0),
                    'About_me': ValueKey(1)
                  },
                  scrollController: _scrollController,
                ),
                SliverToBoxAdapter(
                  child: AutoScrollTag(
                      key: const ValueKey(0),
                      controller: _scrollController,
                      index: 0,
                      child: const WelcomeSection()),
                ),
                const SliverToBoxAdapter(
                  child: Gap(20),
                ),
                SliverToBoxAdapter(
                  child: AutoScrollTag(
                    key: const ValueKey(1),
                    controller: _scrollController,
                    index: 1,
                    child: AboutMeSection(
                      key: _keyAboutMeSection,
                    ),
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
                  iconSize: 36,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    _scrollController.scrollToIndex(1);
                  },
                  icon: const Icon(Icons.arrow_downward))),
        ],
      ),
    );
  }
}
