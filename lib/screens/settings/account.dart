import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "My Account",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Hi, ${userController.user.name} !\n",
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      WidgetSpan(
                          child: Icon(
                            Icons.email,
                            size: 14,
                          ),
                          alignment: PlaceholderAlignment.middle),
                      TextSpan(
                        text: "   ${userController.user.email}\n",
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
