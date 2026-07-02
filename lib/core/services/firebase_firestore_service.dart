import 'dart:developer';

import 'package:chat_app/core/exceptions/app_exeption.dart';
import 'package:chat_app/core/exceptions/firebase_firestore_exceptions.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore;

  FirebaseFirestoreService(this._firestore);
  Future<void> saveUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(user.toMap());
    } on FirebaseException catch (e) {
      log("The error is $e");
      throw FirebaseFirestoreExceptionMapper.map(e);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      return doc.data() != null ? UserModel.fromJson(doc.data()!) : null;
    } on FirebaseException catch (e) {
      throw FirebaseFirestoreExceptionMapper.map(e);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Stream<List<UserModel>> getAllUsers(String currentUserId) {
    try {
      return _firestore.collection('users').snapshots().map((snapshot) {
        return snapshot.docs
            .where((doc) => doc.id != currentUserId)
            .map((doc) => UserModel.fromJson(doc.data()))
            .toList();
      });
    } on FirebaseException catch (e) {
      throw FirebaseFirestoreExceptionMapper.map(e);
    } catch (e) {
      throw AppException(e.toString());
    }
  }
}
