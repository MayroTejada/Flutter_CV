import 'package:flutter/material.dart';
import 'package:my_resume_app/features/landing/widgets/app_bar_content.dart';

import '../../../core/widgets/app_bar/sliver_app_bar.dart';
import '../widgets/im_mario_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              delegate: SliverAppBarDelegate(
                  child: const AppBarContent(), maxHeight: 100, minHeight: 80)),
          const SliverToBoxAdapter(
            child: ImMarioTejadaBody(),
          )
        ],
      ),
    );
  }
}
