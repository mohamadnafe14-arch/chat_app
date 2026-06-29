import 'package:chat_app/core/errors/failuer.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepo {
  Future<Either<Failuer, UserModel>> login(String email, String password);
  Future<Either<Failuer, UserModel>> register({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failuer, Unit>> logout();
  Future<Either<Failuer, UserModel?>> getCurrentUser();
}
