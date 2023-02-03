import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_note/models/noteModel.dart';
import 'package:flutter_note/models/notifyModel.dart';
import 'package:flutter_note/models/projectModel.dart';
import 'package:flutter_note/models/user.dart';
import 'package:flutter_note/screens/home/add_project.dart';
import 'package:uuid/uuid.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userCollection = "users";
  final String projectCollection = "projects";
  final String noteCollection = "notes";
  final String notifyCollection = "notify";

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection(userCollection).doc(user.id).set({
        "id": user.id,
        "name": user.name,
        "email": user.email,
        "imageUser": user.imageUser,
      });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(userCollection).doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addNote(String uid, String title, String body) async {
    try {
      var uuid = Uuid().v4();
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(uuid)
          .set({
        "id": uuid,
        "title": title,
        "body": body,
        "creationDate": Timestamp.now(),
      });
    } catch (e) {
      print(e.message);
    }
  }

  /* Future<void> addProject(String uid, String title, String body) async {
    try {
      var uuid = Uuid().v4();
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(projectCollection)
          .doc(uuid)
          .set({
        "id": uuid,
        "title": title,
        "body": body,
        "creationDate": Timestamp.now(),
      });
    } catch (e) {
      print(e.message);
    }
  } */

  Future<void> updateNote(
      String uid, String title, String body, String id) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(id)
          .update({
        "title": title,
        "body": body,
        "creationDate": Timestamp.now(),
      });
      return true;
    } catch (e) {
      print(e.message);
    }
  }

  /* Future<void> updateProject(
      String uid, String title, String body, String id) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(projectCollection)
          .doc(id)
          .update({
        "title": title,
        "body": body,
        "creationDate": Timestamp.now(),
      });
      return true;
    } catch (e) {
      print(e.message);
    }
  }
 */
  Future<void> deleteNote(String uid, String id) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(id)
          .delete();
    } catch (e) {
      print(e.message);
    }
  }

  /*  Future<void> deleteProject(String uid, String id) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(projectCollection)
          .doc(id)
          .delete();
    } catch (e) {
      print(e.message);
    }
  } */

  /*  Stream<List<ProjectModel>> projectStream(String uid) {
    return _firestore
        .collection(userCollection)
        .doc(uid)
        .collection(projectCollection)
        .orderBy("creationDate", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProjectModel> retValpr = [];
      query.docs.forEach((element) {
        retValpr.add(ProjectModel.fromDocumentSnapshot(element));
      });
      return retValpr;
    });
  } */

  Stream<List<NoteModel>> noteStream(String uid) {
    return _firestore
        .collection(userCollection)
        .doc(uid)
        .collection(noteCollection)
        .orderBy("creationDate", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<NoteModel> retValnote = [];
      query.docs.forEach((element) {
        retValnote.add(NoteModel.fromDocumentSnapshot(element));
      });
      return retValnote;
    });
  }

  Stream<List<NotifyModel>> notifyStream(String uid) {
    return _firestore
        .collection(userCollection)
        .doc(uid)
        .collection(notifyCollection)
        .orderBy("creationDate", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<NotifyModel> retVal1 = [];
      query.docs.forEach((element) {
        retVal1.add(NotifyModel.fromDocumentSnapshot(element));
      });
      print(retVal1);
      return retVal1;
    });
  }
}
