import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:flutter_note/routes.dart';
import 'package:flutter_note/utils/root.dart';
import 'package:flutter_note/utils/theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put<AuthController>(AuthController());
    Get.put<UserController>(UserController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Note',
            theme: Themes().lightTheme,
            darkTheme: Themes().dartTheme,
            themeMode: ThemeMode.system,
            home: Root(),
            // initialRoute: SplashScreen.routeName,
            routes: routes,
          );
        });
  }
}
