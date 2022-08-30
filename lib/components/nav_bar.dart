import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_website/controller/theme.dart';
import 'package:personal_website/controller/locale.dart';
import 'package:personal_website/components/nav_button.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 56);

  final ThemeController themeController = ThemeController.to;
  final LocaleController localeController = LocaleController.to;

  Widget build(BuildContext context) {
    return Obx(() {
      return AppBar(
        automaticallyImplyLeading: false,
        leading: const IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: null,
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            NavButton(),
          ],
        ),
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
            ),
          const SizedBox(
            width: 16,
          ),
        ],
      );
    });
  }
}
