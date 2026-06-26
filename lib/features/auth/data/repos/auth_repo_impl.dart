import 'package:chat_app/core/errors/failuer.dart';
import 'package:chat_app/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl({required super.firebaseAuth});

  @override
  Future<Either<Failuer, User>> login(String email, String password) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return Right(userCredential.user!);
    } catch (e) {
      return Left(FirebaseAuthFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, User>> register(String email, String password) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(userCredential.user!);
    } catch (e) {
      return Left(FirebaseAuthFailuer(e.toString()));
    }
  }
}
