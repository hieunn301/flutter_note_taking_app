import 'package:flutter/material.dart';
import 'package:flutter_note/components/custom_bottom_nav_bar.dart';
import 'package:flutter_note/enums.dart';
import 'package:flutter_note/screens/notify/components/body.dart';

class Notify extends StatelessWidget {
  static String routeName = "/notify";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Notify",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.notify),
    );
  }
}
