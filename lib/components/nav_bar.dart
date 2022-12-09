import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:personal_website/components/nav_button.dart';
import 'package:personal_website/components/search_bar.dart';
import 'package:personal_website/controller/locale.dart';
import 'package:personal_website/controller/search.dart';
import 'package:personal_website/controller/theme.dart';
import 'package:personal_website/models/blog.dart';
import 'package:personal_website/models/project.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 56);

  final ThemeController themeController = ThemeController.to;
  final LocaleController localeController = LocaleController.to;
  final SearchController searchController = SearchController.to;

  bool isActive(String currentRoute, String checkRoute) {
    return currentRoute == checkRoute;
  }

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
            if (searchController.searchBarActivated)
              SearchBar(
                onFocusLeft: searchController.toggleSearchBar,
                updateLastSearch: searchController.updateLastSearch,
                search: searchController.search,
                lastSearch: searchController.lastSearch,
              )
            else ...[
              NavButton(
                onClick: () {
                  Get.toNamed('/experience');
                },
                name: 'experience'.tr,
                icon: Icons.work,
                isActive: isActive(Get.currentRoute, '/experience'),
              ),
              const SizedBox(
                width: 48,
              ),
              NavButton(
                onClick: () {
                  Get.toNamed('/projects');
                },
                name: 'projects'.tr,
                icon: Project.icon,
                isActive: isActive(Get.currentRoute, '/projects'),
              ),
              const SizedBox(
                width: 48,
              ),
              NavButton(
                onClick: () {
                  Get.toNamed('/blog');
                },
                name: 'blog'.tr,
                icon: Blog.icon,
                isActive: isActive(Get.currentRoute, '/blog'),
              ),
              const SizedBox(
                width: 48,
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => searchController.toggleSearchBar(),
              ),
            ],
          ],
        ),
        actions: [
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
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: SvgPicture.asset(
                        'assets/images/flags/flag_us.svg',
                        width: 24,
                      ),
                    ),
                    Text('en_US'.tr),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'de_DE',
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: SvgPicture.asset(
                        'assets/images/flags/flag_germany.svg',
                        width: 24,
                      ),
                    ),
                    Text('de_DE'.tr),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'system',
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: SvgPicture.asset(
                        'assets/images/flags/flag_system.svg',
                        width: 24,
                      ),
                    ),
                    Text('system'.tr),
                  ],
                ),
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
