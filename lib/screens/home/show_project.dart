/* import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/projectController.dart';
import 'package:flutter_note/models/projectModel.dart';
import 'package:flutter_note/screens/home/add_project.dart';
import 'package:flutter_note/screens/home/project_list.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/* DateTime now = DateTime.now();
String formattedTime = DateFormat.Hms().format(now); */

class ShowProject extends StatefulWidget {
  final ProjectModel projectData;
  final int index;
  ShowProject({this.projectData, this.index});

  @override
  State<ShowProject> createState() => _ShowProjectState();
}

class _ShowProjectState extends State<ShowProject> {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController bodyController = TextEditingController();

  String selectedTime;
  Future<void> _show() async {
    final TimeOfDay result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (result != null) {
      setState(() {
        selectedTime = result.format(context);
      });
    }
  }

  DateTime selectedDate = DateTime.now();
  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.projectData.title;
    bodyController.text = widget.projectData.body;
    var formattedDate =
        DateFormat.yMMMd().format(widget.projectData.creationDate.toDate());
    var time = DateFormat.jm().format(widget.projectData.creationDate.toDate());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Show projects",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(
            16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: titleController,
                      maxLines: null,
                      decoration: InputDecoration.collapsed(
                        hintText: "Title project",
                      ),
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      autofocus: true,
                      controller: bodyController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration.collapsed(
                        hintText: "Type something...",
                      ),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text("Created: $formattedDate at $time"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text('Expired: '),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.all(0),
                              ),
                              onPressed: () => selectDate(context),
                              child: Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Text(" at")
                          ],
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.all(0),
                          ),
                          onPressed: _show,
                          child: Text(
                            '$time',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                    GetX<ProjectController>(
                        init: Get.put<ProjectController>(ProjectController()),
                        builder: (ProjectController noteController) {
                          if (noteController != null &&
                              noteController.projects != null) {
                            return ProjectList();
                          } else {
                            return Text("No projects, create some ");
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton.extended(
          backgroundColor: Colors.grey.shade100,
          label: Text(
            'Delete',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            showDeleteDialog(context, widget.projectData);
          },
          heroTag: null,
        ),
        SizedBox(
          height: 20,
          width: 30,
        ),
        FloatingActionButton.extended(
          backgroundColor: Colors.blue,
          label: Text(
            'Update',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            if (titleController.text != widget.projectData.title ||
                bodyController.text != widget.projectData.body) {
              Database().updateNote(
                  authController.user.uid,
                  titleController.text,
                  bodyController.text,
                  widget.projectData.id);
              Get.back();
              titleController.clear();
              bodyController.clear();
            } else {
              showSameContentDialog(context);
            }
          },
          heroTag: null,
        ),
        FloatingActionButton(
          tooltip: "Add Project",
          onPressed: () {
            Get.to(() => AddProject());
          },
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}

void showDeleteDialog(BuildContext context, noteData) {
  final AuthController authController = Get.find<AuthController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          "Delete Project?",
          style: Theme.of(context).textTheme.headline6,
        ),
        content: Text("Are you sure you want to delete this note?",
            style: Theme.of(context).textTheme.subtitle1),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Yes",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onPressed: () {
              Get.back();
              Database().deleteProject(authController.user.uid, noteData.id);
              Get.back(closeOverlays: true);
            },
          ),
          TextButton(
            child: Text(
              "No",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showSameContentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          "No change in content!",
          style: Theme.of(context).textTheme.headline6,
        ),
        content: Text("There is no change in content.",
            style: Theme.of(context).textTheme.subtitle1),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Okay",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
 */