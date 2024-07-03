import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
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
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  final ScrollController _scrollController =
      ScrollController(debugLabel: 'main');
  final ScrollController _welcomeSectionScrollController =
      ScrollController(debugLabel: 'welcome');
  final ScrollController _workScrollController =
      ScrollController(debugLabel: 'work');
  late ScrollController _activeScrollController;
  Drag? _drag;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        page = _pageController.page ?? 0;
      });
    });
    super.initState();
  }

  void _handleDragCancel() {
    _drag?.cancel();
  }

  void _handleDragEnd(DragEndDetails details) {
    _drag?.end(details);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_activeScrollController == _welcomeSectionScrollController &&
        details.primaryDelta! < 0 &&
        _activeScrollController.position.pixels ==
            _activeScrollController.position.maxScrollExtent) {
      _activeScrollController = _pageController;
      _drag?.cancel();
      _drag = _pageController.position.drag(
          DragStartDetails(
              globalPosition: details.globalPosition,
              localPosition: details.localPosition),
          _disposeDrag);
    }
    _drag?.update(details);
  }

  void _disposeDrag() {
    _drag = null;
  }

  void _handleDragStart(DragStartDetails details) {
    if (_welcomeSectionScrollController.hasClients) {
      final RenderBox? renderBox = _welcomeSectionScrollController
          .position.context.storageContext
          .findRenderObject() as RenderBox?;
      if (renderBox!.paintBounds
          .shift(renderBox.localToGlobal(Offset.zero))
          .contains(details.globalPosition)) {
        _activeScrollController = _welcomeSectionScrollController;
        _drag = _activeScrollController.position.drag(details, _disposeDrag);
        return;
      }
    }
    _activeScrollController = _pageController;
    _drag = _pageController.position.drag(details, _disposeDrag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustome(
        pageController: _pageController,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              shrinkWrap: true,
              controller: _scrollController,
              slivers: [
                AppBarContent(
                  currentPage: page,
                  pageController: _pageController,
                ),
                SliverFillRemaining(
                  fillOverscroll: true,
                  child: RawGestureDetector(
                    behavior: HitTestBehavior.opaque,
                    gestures: <Type, GestureRecognizerFactory>{
                      VerticalDragGestureRecognizer:
                          GestureRecognizerFactoryWithHandlers<
                                  VerticalDragGestureRecognizer>(
                              () => VerticalDragGestureRecognizer(),
                              (VerticalDragGestureRecognizer instance) {
                        instance
                          ..onStart = _handleDragStart
                          ..onUpdate = _handleDragUpdate
                          ..onEnd = _handleDragEnd
                          ..onCancel = _handleDragCancel;
                      })
                    },
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      allowImplicitScrolling: true,
                      onPageChanged: (value) {
                        page = value;
                      },
                      controller: _pageController,
                      scrollDirection: Axis.vertical,
                      children: [
                        WelcomeSection(
                          scrollController: _welcomeSectionScrollController,
                        ),
                        const AboutMeSection(),
                        WorkSection(
                          scrollController: _workScrollController,
                        ),
                        const ProjectsSection(),
                      ],
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
                style: ButtonStyle(
                    shadowColor: const WidgetStatePropertyAll(Colors.grey),
                    elevation: const WidgetStatePropertyAll(2),
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).scaffoldBackgroundColor)),
                onPressed: () {
                  if (page < 3) {
                    _pageController.animateToPage(page.toInt() + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  } else {
                    _pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  }
                },
                icon: Icon(
                  page < 3 ? Icons.arrow_downward : Icons.arrow_upward,
                  color: Theme.of(context).primaryColor,
                ),
              )),
        ],
      ),
    );
  }
}
