import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/modules/catalog/catalog_page.dart';
import 'package:kaarte_app/app/modules/create/create_page.dart';
import 'package:kaarte_app/app/modules/menu/menu_page.dart';
import 'package:kaarte_app/app/modules/search/search_page.dart';
import 'package:kaarte_app/app/theme/colors.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Center(
        child: _pageOptions.elementAt(controller.selectedIndex),
      )),
      bottomNavigationBar: Obx(() => Container(
            padding: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        color: Theme.of(context).dividerColor, width: 0.5))),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: controller.selectedIndex == 0
                      ? Icon(FluentIcons.clipboard_image_24_filled)
                      : Icon(FluentIcons.clipboard_image_24_regular),
                  label: 'Catálago',
                ),
                BottomNavigationBarItem(
                  icon: controller.selectedIndex == 1
                      ? Icon(FluentIcons.search_24_filled)
                      : Icon(FluentIcons.search_24_regular),
                  label: 'Pesquisa',
                ),
                BottomNavigationBarItem(
                  icon: controller.selectedIndex == 2
                      ? Icon(FluentIcons.add_circle_24_filled)
                      : Icon(FluentIcons.add_circle_24_regular),
                  label: 'Adicionar',
                ),
                BottomNavigationBarItem(
                  icon: controller.selectedIndex == 3
                      ? Icon(FluentIcons.navigation_24_filled)
                      : Icon(FluentIcons.navigation_24_regular),
                  label: 'Menu',
                ),
              ],
              currentIndex: controller.selectedIndex,
              unselectedItemColor: Colors.black54,
              unselectedLabelStyle: TextStyle(color: Colors.black54),
              unselectedFontSize: 12,
              selectedFontSize: 13,
              selectedItemColor: ColorsApp.primary,
              type: BottomNavigationBarType.fixed,
              onTap: (value) => controller.selectedIndex = value,
              elevation: 0,
            ),
          )),
    );
  }

  final List<Widget> _pageOptions = <Widget>[
    CatalogPage(),
    SearchPage(),
    CreatePage(),
    MenuPage(),
  ];
}
