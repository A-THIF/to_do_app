// lib/services/firestore_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getTasks() {
    return _db
        .collection('tasks')
        .doc(user!.uid)
        .collection('userTasks')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Future<void> addTask(String title, String description) async {
    await _db.collection('tasks').doc(user!.uid).collection('userTasks').add({
      'title': title,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateTask(
    String docId,
    String newTitle,
    String newDescription,
  ) async {
    await _db
        .collection('tasks')
        .doc(user!.uid)
        .collection('userTasks')
        .doc(docId)
        .update({'title': newTitle, 'description': newDescription});
  }

  Future<void> deleteTask(String docId) async {
    await _db
        .collection('tasks')
        .doc(user!.uid)
        .collection('userTasks')
        .doc(docId)
        .delete();
  }
}
