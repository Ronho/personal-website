import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:personal_website/components/nav_button.dart';
import 'package:personal_website/components/search_bar.dart';
import 'package:personal_website/controller/locale.dart';
import 'package:personal_website/controller/search.dart';
import 'package:personal_website/controller/theme.dart';
import 'package:personal_website/models/blog.dart';
import 'package:personal_website/models/project.dart';
import 'package:personal_website/services/size.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  NavBar({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 56);

  final ThemeController themeController = ThemeController.to;
  final LocaleController localeController = LocaleController.to;
  final SearchController searchController = SearchController.to;

  bool isActive(String currentRoute, String checkRoute) {
    return currentRoute == checkRoute;
  }

  Widget getLeading(bool isSmall) {
    if (isSmall & (scaffoldKey != null)) {
      return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldKey!.currentState?.openDrawer());
    } else {
      return IconButton(
        icon: const Icon(Icons.account_circle),
        onPressed: () {
          Get.toNamed('/');
        },
      );
    }
  }

  Widget getTitle(bool searchIsActivated, bool isSmall, double width) {
    if (searchIsActivated | isSmall) {
      return SearchBar(
        onFocusLeft: searchController.toggleSearchBar,
        updateLastSearch: searchController.updateLastSearch,
        search: searchController.search,
        lastSearch: searchController.lastSearch,
        width: width,
        height: 50,
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
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
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double titleWidth =
        SizeService.middleSize(width, 300, 150, maxWidth: 750);
    final bool isSmall = width < SizeService.smallNavBar;

    return Obx(() {
      return AppBar(
        automaticallyImplyLeading: false,
        leading: getLeading(isSmall),
        centerTitle: true,
        title:
            getTitle(searchController.searchBarActivated, isSmall, titleWidth),
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
