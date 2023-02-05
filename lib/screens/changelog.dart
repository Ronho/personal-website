import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';

import 'package:personal_website/controller/changelog.dart';
import 'package:personal_website/screens/screen_wrapper.dart';

class ResponsiveController extends GetxController {}

class ChangelogScreen extends GetResponsiveView<ResponsiveController> {
  ChangelogScreen({Key? key}) : super(key: key);

  final ChangelogController c = Get.put(ChangelogController());

  @override
  Widget builder() {
    return ScreenWrapper(
      maxWidth: 800,
      child: SliverToBoxAdapter(
        child: Obx(() {
          return Column(
            children: [
              Markdown(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                selectable: true,
                extensionSet: md.ExtensionSet.gitHubWeb,
                data: c.changelog,
                onTapLink: (text, url, title) {
                  if (url != null) {
                    final uri = Uri.parse(url);
                    launchUrl(uri);
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          );
        }),
      ),
    );
  }
}
