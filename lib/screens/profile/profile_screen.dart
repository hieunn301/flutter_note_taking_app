import 'package:flutter/material.dart';
import 'package:flutter_note/components/custom_bottom_nav_bar.dart';
import 'package:flutter_note/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
