import 'package:flutter/material.dart';
import 'package:flutter_note/screens/profile/components/profile_menu.dart';
import 'package:flutter_note/screens/settings/widgets/list_tile.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';

class DarkMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ProfileMenu(
                text: "Use device setting",
                icon: "assets/icons/Discover.svg",
                press: () {
                  Get.changeThemeMode(ThemeMode.system);
                },
              ),
              /* ListTileSetting(
                  onTap: () {
                    Get.changeThemeMode(ThemeMode.system);
                  },
                  title: "Use device setting",
                  iconData: Icons.settings_brightness_outlined,
                  subtitle: Text(
                    "Auttomatically swtich between Light and Dark themes when your system does",
                  )), */
              ProfileMenu(
                text: "Light Mode",
                icon: "assets/icons/Location point.svg",
                press: () {
                  Get.changeThemeMode(ThemeMode.light);
                },
              ),
              /* ListTileSetting(
                onTap: () {
                  Get.changeThemeMode(ThemeMode.light);
                },
                title: "Light Mode",
                iconData: Icons.brightness_5,
                subtitle: null,
              ), */
              ProfileMenu(
                text: "Dark Mode",
                icon: "assets/icons/Question mark.svg",
                press: () {
                  Get.changeThemeMode(ThemeMode.dark);
                },
              ),
              /* ListTileSetting(
                iconData: Icons.brightness_4_outlined,
                onTap: () {
                  Get.changeThemeMode(ThemeMode.dark);
                },
                title: "Dark Mode",
                subtitle: null,
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
