import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:personal_website/models/experience.dart';

class ExperienceController extends GetxController {
  static ExperienceController get to => Get.find();

  RxList<Experience> experience = <Experience>[].obs;

  ExperienceController() {
    getExperience();
  }

  Future<void> getExperience() async {
    final String jsonText =
    await rootBundle.loadString('assets/data/experience.json');
    final dynamic json = jsonDecode(jsonText);
    List<Experience> experience = [];
    for (dynamic exp in json) {
      experience.add(Experience.fromJson(exp));
    }
    this.experience.assignAll(experience);
  }
}
