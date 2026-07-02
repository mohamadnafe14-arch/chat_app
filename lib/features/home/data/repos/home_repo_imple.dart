import 'package:chat_app/core/errors/failuer.dart';
import 'package:chat_app/core/services/firebase_firestore_service.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/home/data/repos/home_repo.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepoImple implements HomeRepo {
  final FirebaseFirestoreService _firebaseFirestoreService;
  HomeRepoImple(this._firebaseFirestoreService);

  @override
  Either<Failuer, Stream<List<UserModel>>> getAllUsers(String currentUserId) {
    try {
      final usersStream = _firebaseFirestoreService.getAllUsers(currentUserId);
      return Right(usersStream);
    } catch (e) {
      return Left(FirebaseFirestoreFailuer(e.toString()));
    }
  }
}
