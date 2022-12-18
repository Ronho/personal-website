import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:personal_website/controller/theme.dart';
import 'package:personal_website/controller/locale.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  Footer({Key? key}) : super(key: key);

  final ThemeController themeController = ThemeController.to;
  final LocaleController localeController = LocaleController.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(5, 17, 32, 1),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 25),
          IconButton(
              onPressed: () {
                launchUrl(Uri.parse(
                    'https://www.linkedin.com/in/ron-holzapfel-311036186/'));
              },
              iconSize: 50,
              icon: SvgPicture.asset('assets/images/logos/linkedin.svg')),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Get.toNamed('/');
                  },
                  child: Text('home'.tr)),
              const Text(' • '),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/experience');
                  },
                  child: Text('experience'.tr)),
              const Text(' • '),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/projects');
                  },
                  child: Text('projects'.tr)),
              const Text(' • '),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/blog');
                  },
                  child: Text('blog'.tr)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Get.toNamed('/imprint');
                  },
                  child: Text('imprint'.tr)),
              const Text(' • '),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/data_protection');
                  },
                  child: Text('data_protection'.tr)),
            ],
          ),
          const Text(
            '© 2023 Ron Holzapfel',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
