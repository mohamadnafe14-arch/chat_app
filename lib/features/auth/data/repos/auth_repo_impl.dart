import 'package:chat_app/core/errors/failuer.dart';
import 'package:chat_app/core/services/firebase_auth_service.dart';
import 'package:chat_app/core/services/firebase_firestore_service.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/auth/data/repos/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthservice;
  final FirebaseFirestoreService _firebaseFirestoreService;
  AuthRepoImpl(this.firebaseAuthservice, this._firebaseFirestoreService);
  @override
  Future<Either<Failuer, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      final user = await firebaseAuthservice.login(
        email: email,
        password: password,
      );
      if (user != null) {
        final userModel = await _firebaseFirestoreService.getUser(user.uid);
        return Right(userModel!);
      }
      return const Left(FirebaseAuthFailuer('User not found'));
    } catch (e) {
      return Left(FirebaseAuthFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, UserModel>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await firebaseAuthservice.register(
        email: email,
        password: password,
      );
      if (user != null) {
        final userModel = UserModel(uid: user.uid, email: email, name: name);
        await _firebaseFirestoreService.saveUser(userModel);
        return Right(userModel);
      }
      return const Left(FirebaseAuthFailuer('User not found'));
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

  @override
  Future<Either<Failuer, UserModel?>> getCurrentUser() async {
    try {
      final currentUser = firebaseAuthservice.getCurrentUser();
      if (currentUser != null) {
        final user = await _firebaseFirestoreService.getUser(currentUser.uid);
        return Right(user);
      }
      return const Right(null);
    } catch (e) {
      return Left(FirebaseAuthFailuer(e.toString()));
    }
  }
}
