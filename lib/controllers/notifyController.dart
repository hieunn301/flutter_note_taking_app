import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/models/notifyModel.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';

class NotifyController extends GetxController {
  RxList<NotifyModel> notifyList = RxList<NotifyModel>();
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;

  List<NotifyModel> get notifys => notifyList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user?.uid;
    print("NotifyController onit :: $uid");
    notifyList
        .bindStream(Database().notifyStream(uid)); //stream coming from firebase
    super.onInit();
  }
}
