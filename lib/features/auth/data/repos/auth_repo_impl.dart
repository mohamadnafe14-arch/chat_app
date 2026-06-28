import 'package:chat_app/core/errors/failuer.dart';
import 'package:chat_app/core/services/firebase_auth_service.dart';
import 'package:chat_app/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthservice;

  AuthRepoImpl(this.firebaseAuthservice);
  @override
  Future<Either<Failuer, User>> login(String email, String password) async {
    try {
      final user = await firebaseAuthservice.login(
        email: email,
        password: password,
      );
      return Right(user!);
    } catch (e) {
      return Left(FirebaseAuthFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, User>> register(String email, String password) async {
    try {
      final user = await firebaseAuthservice.register(
        email: email,
        password: password,
      );
      return Right(user!);
    } catch (e) {
      return Left(FirebaseAuthFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, Unit>> logout() async {
    try {
      await firebaseAuthservice.logout();
      return const Right(unit);
    } catch (e) {
      return Left(FirebaseAuthFailuer(e.toString()));
    }
  }
}
