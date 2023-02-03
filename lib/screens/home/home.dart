import 'package:flutter/material.dart';
import 'package:flutter_note/components/custom_bottom_nav_bar.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/controllers/projectController.dart';
import 'package:flutter_note/enums.dart';
import 'package:flutter_note/screens/home/add_note.dart';
import 'package:flutter_note/screens/home/add_project.dart';
import 'package:flutter_note/screens/home/note_list.dart';
import 'package:flutter_note/screens/home/project_list.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<AuthController> {
  static String routeName = "/home";
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/trello_bg_wh.svg',
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Trello",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Obx(() => Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            onChanged: (value) => print(value),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomIconBtn(
                              color: Theme.of(context).backgroundColor,
                              onPressed: () {
                                authController.axisCount.value =
                                    authController.axisCount.value == 2 ? 4 : 2;
                              },
                              icon: Icon(authController.axisCount.value == 2
                                  ? Icons.list
                                  : Icons.grid_on),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GetX<NoteController>(
                      init: Get.put<NoteController>(NoteController()),
                      builder: (NoteController noteController) {
                        if (noteController != null &&
                            noteController.notes != null) {
                          return NoteList();
                        } else {
                          return Text("No notes, create some ");
                        }
                      }),
                  /* GetX<ProjectController>(
                      init: Get.put<ProjectController>(ProjectController()),
                      builder: (ProjectController projectController) {
                        if (projectController != null &&
                            projectController.projects != null) {
                          return ProjectList();
                        } else {
                          return Text("No projects, create some ");
                        }
                      }), */
                ],
              )),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      floatingActionButton: FloatingActionButton(
          tooltip: "Add Note",
          onPressed: () {
            Get.to(() => AddNote());
            // Get.to(() => AddProject());
          },
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          )),
    );
  }
}
