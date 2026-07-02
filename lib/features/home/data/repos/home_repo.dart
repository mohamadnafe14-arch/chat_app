import 'package:chat_app/core/errors/failuer.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepo {
  Either<Failuer, Stream<List<UserModel>>> getAllUsers(String currentUserId);
}
