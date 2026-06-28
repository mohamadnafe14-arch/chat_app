import 'package:chat_app/core/exceptions/app_exeption.dart';
import 'package:chat_app/core/exceptions/firebase_auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);
  Future<User?> login({required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMapper.map(e);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<User?> register({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMapper.map(e);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMapper.map(e);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMapper.map(e);
    } catch (e) {
      throw AppException(e.toString());
    }
  }
}
