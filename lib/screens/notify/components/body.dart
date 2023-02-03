import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/controllers/notifyController.dart';
import 'package:flutter_note/screens/home/notify_list.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final NoteController noteController = Get.find<NoteController>();
  final NotifyController notifyController = Get.put(NotifyController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: GetX<NotifyController>(
          init: Get.put<NotifyController>(NotifyController()),
          builder: (NotifyController noteController) {
            if (noteController != null && noteController.notifys != null) {
              return NotifyList();
            } else {
              return Text("No notes, create some ");
            }
          }),
    );
  }
}
