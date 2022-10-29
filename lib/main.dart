import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:personal_website/i18n/messages.dart';
import 'package:personal_website/screens/blog.dart';
import 'package:personal_website/screens/experience.dart';
import 'package:personal_website/screens/landing.dart';
import 'package:personal_website/screens/projects.dart';
import 'package:personal_website/theme/themes.dart';
import 'package:personal_website/screens/not_found.dart';
import 'package:personal_website/controller/theme.dart';
import 'package:personal_website/controller/locale.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => LocaleController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'name',
      initialRoute: '/',
      themeMode: ThemeController.to.getThemeMode(),
      darkTheme: Themes.darkTheme,
      theme: Themes.lightTheme,
      translations: Messages(),
      locale: LocaleController.to.getLocale(),
      fallbackLocale: LocaleController.fallbackLocale,
      unknownRoute: GetPage(
        name: '/404',
        page: () => const NotFoundScreen(),
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const LandingScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/projects',
          page: () => ProjectScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/experience',
          page: () => const ExperienceScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/blog',
          page: () => BlogScreen(),
          transition: Transition.noTransition,
        ),
      ],
    );
  }
}