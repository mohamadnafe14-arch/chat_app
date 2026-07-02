part of 'users_cubit_cubit.dart';

@immutable
sealed class UsersCubitState {}

final class UsersCubitInitial extends UsersCubitState {}

final class UsersCubitLoading extends UsersCubitState {}

final class UsersCubitSuccess extends UsersCubitState {
  final List<UserModel> users;
  UsersCubitSuccess(this.users);
}

final class UsersCubitFailure extends UsersCubitState {
  final String message;
  UsersCubitFailure(this.message);
}
