import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/models/notifyModel.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/* DateTime now = DateTime.now();
String formattedTime = DateFormat.Hms().format(now); */

class ShowNotify extends StatefulWidget {
  final NotifyModel notifyData;
  final int index;
  ShowNotify({this.notifyData, this.index});

  @override
  State<ShowNotify> createState() => _ShowNotifyState();
}

class _ShowNotifyState extends State<ShowNotify> {
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

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.notifyData.title;
    bodyController.text = widget.notifyData.body;
    var formattedDate =
        DateFormat.yMMMd().format(widget.notifyData.creationDate.toDate());
    var time = DateFormat.jm().format(widget.notifyData.creationDate.toDate());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Show notifys",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Text('asdjfbadfjklasd'),
      ),
    );
  }
}
