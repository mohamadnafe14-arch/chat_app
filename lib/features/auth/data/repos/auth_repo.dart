import 'package:chat_app/core/errors/failuer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepo {
  Future<Either<Failuer, User>> login(String email, String password);
  Future<Either<Failuer, User>> register(String email, String password);
  Future<Either<Failuer, Unit>> logout();
  Either<Failuer, User?> getCurrentUser();
}
