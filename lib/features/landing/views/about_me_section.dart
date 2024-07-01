import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_resume_app/core/paths/images_paths.dart';
import 'package:my_resume_app/features/landing/widgets/about_me/gallery_list.dart';

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({super.key});

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'About me',
          style: TextStyle(fontSize: 38, color: Theme.of(context).primaryColor),
        ),
        const Gap(20),
        GalleryList(
          itemsPerPage: 1,
          items: [
            GalleryItem(
                description:
                    'In general dog and cat lover (My Dogs Chop and Suki)',
                title: 'Pets',
                image: const AssetImage(pugsAndMePath)),
            GalleryItem(
                description: 'Picture of the "door" of the state of chihuahua',
                title: 'I born in Chihuahua,Chihuahua Mexico',
                image: const AssetImage(chihuahuaDoorPath)),
            GalleryItem(
                description:
                    'Graduated from Instituto Tecnologico de Chihuahua no 2 in Computer science(2018-2022)',
                title: '<3',
                image: const AssetImage(tecGraduationPath))
          ],
        )
      ],
    );
  }
}
