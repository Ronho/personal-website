import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleController extends GetxController {
  static LocaleController get to => Get.find();
  static String fallbackLocaleString = 'system';
  static Map<String, Locale> localeMap = {
    'de_DE': const Locale('de', 'DE'),
    'en_US': const Locale('en', 'US'),
    'fallback': const Locale('en', 'US'),
  };
  static Locale fallbackLocale = localeMap['fallback']!;


  final GetStorage _getStorage = GetStorage();
  final String localeKey = 'locale';

  final Rx<Locale?> _locale = Get.deviceLocale.obs;
  Locale get locale => _locale.value ?? fallbackLocale;

  final Rx<String?> _localeString = fallbackLocaleString.obs;
  String get localeString => _localeString.value ?? fallbackLocaleString;

  void updateLocale(Locale locale, String? localeString) {
    _locale.value = locale;
    _localeString.value = localeString ?? fallbackLocaleString;
    update();
  }

  static Locale stringToLocale(String? localeString) {
    Locale locale;

    if (localeString != null && localeMap.keys.contains(localeString)) {
      locale = localeMap[localeString]!;
    } else {
      locale = Get.deviceLocale ?? fallbackLocale;
    }

    return locale;
  }

  Locale getLocale() {
    String? localeString = _getStorage.read(localeKey);
    Locale locale = LocaleController.stringToLocale(localeString);
    updateLocale(locale, localeString);
    return locale;
  }

  Future<void> saveLocale(String localeString) async {
    await _getStorage.write(localeKey, localeString);
    Locale locale = LocaleController.stringToLocale(localeString);
    updateLocale(locale, localeString);
  }
}