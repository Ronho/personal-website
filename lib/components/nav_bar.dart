import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:personal_website/controller/theme.dart';
import 'package:personal_website/controller/locale.dart';
import 'package:personal_website/components/nav_button.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 56);

  final ThemeController themeController = ThemeController.to;
  final LocaleController localeController = LocaleController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            Get.toNamed('/');
          },
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            NavButton(
              onClick: () {
                Get.toNamed('/experience');
              },
              name: 'Experience',
              icon: Icons.work,
            ),
            const SizedBox(
              width: 48,
            ),
            NavButton(
              onClick: () {
                Get.toNamed('/projects');
              },
              name: 'Projects',
              icon: Icons.view_kanban,
            ),
            const SizedBox(
              width: 48,
            ),
            NavButton(
              onClick: () {
                Get.toNamed('/blog');
              },
              name: 'Blog',
              icon: Icons.feed,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {}, //TODO: display search bar
            icon: const Icon(Icons.search),
          ),
          SvgPicture.asset('assets/images/flags/flag_germany.svg', width: 50,),
          SvgPicture.asset('assets/images/flags/flag_us.svg', width: 50,),

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
