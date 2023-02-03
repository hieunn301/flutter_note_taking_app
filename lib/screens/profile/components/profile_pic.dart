import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File _imageFile;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          _imageFile == null
              ? CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/Profile Image.png"))
              : CircleAvatar(backgroundImage: FileImage(_imageFile)),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  takePhoto();
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto() async {
    XFile xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    print('xFile + ${xfile?.path}');
    _imageFile = File(xfile.path);
    setState(() {});
    // uploadImage();
  }

  /* Future<String> uploadImage() async {
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child('profile')
        .child('${FirebaseFirestore.instance.collection("users")}')
        .putFile(_imageFile);
    print('11${taskSnapshot.ref.getDownloadURL()}');
    return taskSnapshot.ref.getDownloadURL();
  } */
}
