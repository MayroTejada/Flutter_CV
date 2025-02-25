import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_resume_app/core/responsive/responsive_layout.dart';
import 'package:my_resume_app/features/landing/widgets/made_with_flutter_banner.dart';
import 'package:my_resume_app/features/landing/widgets/welcome/im_mario_body.dart';
import 'package:my_resume_app/features/landing/widgets/welcome/social_media_icon_list.dart';

class WelcomeSection extends StatefulWidget {
  final ScrollController scrollController;
  const WelcomeSection({super.key, required this.scrollController});

  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      controller: widget.scrollController,
      shrinkWrap: true,
      children: const [
        ImMarioTejadaBody(),
        ResponsiveLayout(
          childMobile: Flex(
            direction: Axis.vertical,
            children: [
              Text(
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                  '“Code never lies, comments sometimes do.”\n-Ron Jeffries'),
              Center(child: SocialMediaIconList()),
              MadeWithFlutterBanner()
            ],
          ),
          childDesktop: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Center(
                    child: Column(
                  children: [
                    SocialMediaIconList(),
                    Gap(10),
                    MadeWithFlutterBanner()
                  ],
                )),
              ),
              Expanded(
                  child: Text(
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                      '“Code never lies, comments sometimes do.”\n-Ron Jeffries'))
            ],
          ),
        ),
        Gap(10)
      ],
    );
  }
}
