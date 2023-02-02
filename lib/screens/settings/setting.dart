/* import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/screens/settings/account.dart';
import 'package:flutter_note/screens/settings/dark_mode.dart';
import 'package:flutter_note/screens/settings/widgets/list_tile.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  static String routeName = "/setting";
  final AuthController authController = Get.find<AuthController>();
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
              ListTileSetting(
                onTap: () {
                  Get.to(() => Account());
                },
                title: "Account",
                iconData: Icons.person,
                subtitle: null,
              ),
              ListTileSetting(
                onTap: () {
                  Get.to(() => DarkMode());
                },
                title: "Dark Mode",
                iconData: Icons.nights_stay,
                subtitle: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */