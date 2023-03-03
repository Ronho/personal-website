import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:personal_website/controller/theme.dart';
import 'package:personal_website/controller/locale.dart';
import 'package:personal_website/version.dart' as v;
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
          Wrap(
            spacing: 8.0,
            alignment: WrapAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Get.toNamed('/');
                  },
                  child: Text('home'.tr)),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/experience');
                  },
                  child: Text('experience'.tr)),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/projects');
                  },
                  child: Text('projects'.tr)),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/blog');
                  },
                  child: Text('blog'.tr)),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/learning');
                  },
                  child: Text('learn'.tr)),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/changelog');
                  },
                  child: Text('changelog'.tr)),
            ],
          ),
          SelectableText(
            '© ${DateFormat('y').format(DateTime.now())} ' +
                '${'name'.tr} • ${v.VERSION}',
            style: const TextStyle(color: Colors.grey),
          ),
          Wrap(
            spacing: 8.0,
            alignment: WrapAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'contact_email'.tr,
                    query: 'subject=${'contact_email_subject'.tr}',
                  );
                  launchUrl(emailLaunchUri);
                },
                child: Text('contact_email_text'.tr),
              ),
              TextButton(
                onPressed: () {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'issues_email'.tr,
                    query: 'subject=${'issue_email_subject'.tr}',
                  );
                  launchUrl(emailLaunchUri);
                },
                child: Text('issues_email_text'.tr),
              ),
            ],
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
