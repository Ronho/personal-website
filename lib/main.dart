import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:personal_website/i18n/messages.dart';
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
          page: () => MyHomePage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/projects',
          page: () => const ProjectScreen(),
          transition: Transition.noTransition,
        ),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ThemeController themeController = ThemeController.to;
  final LocaleController localeController = LocaleController.to;

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Sample App Bar"),
          actions: [
            ElevatedButton(
              child: const Text('2nd Page'),
              onPressed: () {
                Get.toNamed('/projects');
              },
            ),
            // Buttons to change locale and language
            DropdownButton<String>(
              value: localeController.localeString,
              onChanged: (value) async {
                if (value != null) {
                  await localeController.saveLocale(value);
                  Get.updateLocale(localeController.locale);
                }
              },
              items: [
                DropdownMenuItem(
                  value: 'en_US',
                  child: Text('en_US'.tr),
                ),
                DropdownMenuItem(
                  value: 'de_DE',
                  child: Text('de_DE'.tr),
                ),
                DropdownMenuItem(
                  value: 'system',
                  child: Text('system'.tr),
                ),
              ],
            ),

            // Buttons to change theme
            if (ThemeController.isLight(themeController.themeModeString))
              IconButton(
                onPressed: () async {
                  await themeController.saveThemeMode('dark');
                  Get.changeThemeMode(themeController.themeMode);
                },
                icon: const Icon(Icons.dark_mode),
              )
            else
              IconButton(
                onPressed: () async {
                  await themeController.saveThemeMode('light');
                  Get.changeThemeMode(themeController.themeMode);
                },
                icon: const Icon(Icons.brightness_high),
              )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'name'.tr,
              ),
            ],
          ),
        ),
      );
    });
  }
}
