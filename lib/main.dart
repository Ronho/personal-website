import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:personal_website/firebase_options.dart';
import 'package:personal_website/i18n/messages.dart';
import 'package:personal_website/screens/blog.dart';
import 'package:personal_website/screens/blog_details.dart';
import 'package:personal_website/screens/changelog.dart';
import 'package:personal_website/screens/experience.dart';
import 'package:personal_website/screens/imprint.dart';
import 'package:personal_website/screens/landing.dart';
import 'package:personal_website/screens/not_found.dart';
import 'package:personal_website/screens/project.dart';
import 'package:personal_website/screens/spaced_repetition.dart';
import 'package:personal_website/theme/themes.dart';
import 'package:personal_website/controller/blogs.dart';
import 'package:personal_website/controller/changelog.dart';
import 'package:personal_website/controller/experience.dart';
import 'package:personal_website/controller/locale.dart';
import 'package:personal_website/controller/projects.dart';
import 'package:personal_website/controller/search.dart';
import 'package:personal_website/controller/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<LocaleController>(() => LocaleController());
    Get.lazyPut<SearchBarController>(() => SearchBarController());
    Get.lazyPut<ChangelogController>(() => ChangelogController());
    Get.put<BlogsController>(BlogsController());
    Get.put<ProjectsController>(ProjectsController());
    Get.put<ExperienceController>(ExperienceController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ron Holzapfel',
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
          page: () => ExperienceScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/blog',
          page: () => BlogScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/blog/:id',
          page: () => BlogDetailsScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/imprint',
          page: () => const ImprintScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/changelog',
          page: () => ChangelogScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/learning',
          page: () => SpacedRepetitionScreen(),
          transition: Transition.noTransition,
        ),
      ],
    );
  }
}
