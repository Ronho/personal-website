import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChangelogController extends GetxController {
  static ChangelogController get to => Get.find();

  Rx<String> _changelog = ''.obs;
  String get changelog => _changelog.value;

  ChangelogController() {
    getChangelog();
  }

  Future<void> getChangelog() async {
    final String markdownText =
    await rootBundle.loadString('assets/data/CHANGELOG.md');
    _changelog.value = markdownText;
    update();
  }
}
