import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  static String fallbackThemeModeString = 'system';
  static Map<String, ThemeMode> themeModeMap = {
    'dark': ThemeMode.dark,
    'light': ThemeMode.light,
    'default': ThemeMode.dark
  };

  final GetStorage _getStorage = GetStorage();
  final String themeModeKey = 'themeMode';

  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;
  ThemeMode get themeMode => _themeMode.value;

  final Rx<String> _themeModeString = fallbackThemeModeString.obs;
  String get themeModeString => _themeModeString.value;

  void updateThemeMode(ThemeMode themeMode, String? themeModeString) {
    _themeMode.value = themeMode;
    _themeModeString.value = themeModeString ?? fallbackThemeModeString;
    update();
  }

  static ThemeMode stringToThemeMode(String? themeString) {
    ThemeMode themeMode;

    if (themeString != null && themeModeMap.keys.contains(themeString)) {
      themeMode = themeModeMap[themeString]!;
    } else {
      themeMode = themeModeMap['default']!;
    }

    return themeMode;
  }

  static bool isLight(String themeString) {
    bool isLight = true;

    if (themeString.toLowerCase() != 'light') {
      isLight = false;
    }

    return isLight;
  }

  ThemeMode getThemeMode() {
    String? themeModeString = _getStorage.read(themeModeKey);
    ThemeMode themeMode = ThemeController.stringToThemeMode(themeModeString);
    updateThemeMode(themeMode, themeModeString);
    return themeMode;
  }

  Future<void> saveThemeMode(String themeModeString) async {
    await _getStorage.write(themeModeKey, themeModeString);
    ThemeMode themeMode = ThemeController.stringToThemeMode(themeModeString);
    updateThemeMode(themeMode, themeModeString);
  }
}