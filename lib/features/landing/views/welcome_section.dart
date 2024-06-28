import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_resume_app/features/landing/widgets/welcome/im_mario_body.dart';
import 'package:my_resume_app/features/landing/widgets/welcome/social_media_icon_list.dart';

class WelcomeSection extends StatefulWidget {
  const WelcomeSection({super.key});

  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ImMarioTejadaBody(),
        Gap(15),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Center(child: SocialMediaIconList()),
            ),
            Expanded(
                child: Text(
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    '“Code never lies, comments sometimes do.”\n-Ron Jeffries'))
          ],
        ),
        Gap(10)
      ],
    );
  }
}
