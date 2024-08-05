import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_resume_app/core/theme/extensions/theme_data_extensions.dart';

class MadeWithFlutterBanner extends StatelessWidget {
  const MadeWithFlutterBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Made with Flutter!!',
          style:
              Theme.of(context).appTextsTheme.textStyle.copyWith(fontSize: 23),
        ),
        const Gap(10),
        Icon(
          size: 40,
          Icons.flutter_dash_sharp,
          color: Theme.of(context).appTextsTheme.textStyle.color,
        )
      ],
    );
  }
}
