/* import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/projectController.dart';
import 'package:flutter_note/screens/home/show_project.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ProjectList extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final ProjectController projectController = Get.find<ProjectController>();
  final lightColors = [
    Colors.grey.shade200,
  ];

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      itemCount: projectController.projects.length,
      staggeredTileBuilder: (index) =>
          StaggeredTile.fit(authController.axisCount.value),
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        var formattedDate = DateFormat.yMMMd()
            .format(projectController.projects[index].creationDate.toDate());
        Random random = new Random();
        Color bg = lightColors[random.nextInt(1)];
        return GestureDetector(
          onTap: () {
            Get.to(() => ShowProject(
                index: index, projectData: projectController.projects[index]));
          },
          child: Container(
            padding: EdgeInsets.only(
              bottom: 10,
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              color: bg,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(
                    top: 5,
                    right: 8,
                    left: 8,
                    bottom: 0,
                  ),
                  title: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: Text(
                      projectController.projects[index].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    projectController.projects[index].body,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      formattedDate,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
 */