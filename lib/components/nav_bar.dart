import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_website/components/locale_button.dart';
import 'package:personal_website/components/nav_button.dart';
import 'package:personal_website/components/search_bar.dart';
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
        icon: Image.asset('images/Icon-192.png'),
        onPressed: () {
          Get.toNamed('/');
        },
      );
    }
  }

  Widget getTitle(bool searchIsActivated, bool isSmall, double width) {
    if (searchIsActivated) {
      return SearchBar(
        onFocusLeft: searchController.toggleSearchBar,
        updateLastSearch: searchController.updateLastSearch,
        search: searchController.search,
        lastSearch: searchController.lastSearch,
        width: width,
        height: 50,
        isSmall: isSmall,
      );
    } else if (isSmall) {
      return NavButton(
        onClick: searchController.toggleSearchBar,
        name: 'search'.tr,
        icon: Icons.search,
        isActive: true,
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
      if (searchController.searchBarActivated & isSmall) {
        return SearchBar(
          onFocusLeft: searchController.toggleSearchBar,
          updateLastSearch: searchController.updateLastSearch,
          search: searchController.search,
          lastSearch: searchController.lastSearch,
          width: width,
          height: 50,
          isSmall: isSmall,
        );
      } else {
        return AppBar(
          automaticallyImplyLeading: false,
          leading: getLeading(isSmall),
          centerTitle: true,
          title: getTitle(
              searchController.searchBarActivated, isSmall, titleWidth),
          actions: [
            if (!isSmall)
              LocaleButton(),

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
      }
    });
  }
}
