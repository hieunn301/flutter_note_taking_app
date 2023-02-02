import 'package:flutter/widgets.dart';
import 'package:flutter_note/screens/auth/forgot_password.dart';
import 'package:flutter_note/screens/auth/login.dart';
import 'package:flutter_note/screens/auth/signup.dart';
import 'package:flutter_note/screens/home/home.dart';
import 'package:flutter_note/screens/notify/notify.dart';
import 'package:flutter_note/screens/profile/profile_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (context) => Login(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  SignUp.routeName: (context) => SignUp(),
  HomePage.routeName: (context) => HomePage(),
  Notify.routeName: (context) => Notify(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
