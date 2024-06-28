import 'package:flutter/material.dart';
import 'package:my_resume_app/features/landing/widgets/about_me/gallery_list.dart';

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({super.key});

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'About me',
            style:
                TextStyle(fontSize: 38, color: Theme.of(context).primaryColor),
          ),
          const GalleryList()
        ],
      ),
    );
  }
}
