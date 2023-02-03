import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/notifyController.dart';
import 'package:get/get.dart';

class NotifyList extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final NotifyController notifyController = Get.find<NotifyController>();
  @override
  Widget build(BuildContext context) {
    return Text("thong bao 1");
  }
}
