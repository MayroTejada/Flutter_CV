import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconList extends StatelessWidget {
  const SocialMediaIconList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SocialMedia> socialMediaList = [
      SocialMedia(
          name: 'Instagram',
          icon: const ImageIcon(AssetImage('assets/images/instagram.png')),
          url: Uri.https('www.instagram.com', '/mayro_tejada.json/')),
      SocialMedia(
          name: 'Facebook',
          icon: const Icon(Icons.facebook),
          url: Uri.https('www.facebook.com', '/axel.broos/')),
      SocialMedia(
          name: 'Github',
          icon: const ImageIcon(AssetImage('assets/images/github.png')),
          url: Uri.https('github.com', '/MayroTejada')),
      SocialMedia(
          name: 'LinkedIn',
          icon: const ImageIcon(AssetImage('assets/images/linkedin.png')),
          url: Uri.https(
              'www.linkedin.com', '/in/mario-andres-tejada-morales-bb9827231')),
    ];
    return Wrap(
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 15,
      children: [
        ...socialMediaList
            .map((value) => Semantics(
                  button: true,
                  enabled: true,
                  label: value.name,
                  child: IconButton(
                      color: Theme.of(context).primaryColor,
                      iconSize: 24,
                      onPressed: () async {
                        if (!await launchUrl(value.url)) {
                          print('error');
                        }
                      },
                      icon: value.icon),
                ))
            .toList()
      ],
    );
  }
}

class SocialMedia {
  final String name;
  final Widget icon;
  final Uri url;

  SocialMedia({required this.name, required this.icon, required this.url});
}
