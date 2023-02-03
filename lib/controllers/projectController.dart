/* import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/models/projectModel.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  RxList<ProjectModel> projectList = RxList<ProjectModel>();
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;

  // ignore: invalid_use_of_protected_member
  List<ProjectModel> get projects => projectList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user?.uid;
    print("ProjetcController onit :: $uid");
    projectList.bindStream(
        Database().projectStream(uid)); //stream coming from firebase
    super.onInit();
  }
}
 */