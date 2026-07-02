import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_cubit_state.dart';

class UsersCubit extends Cubit<UsersCubitState> {
  final HomeRepo homeRepo;
  String? userSearchQuery;
  UsersCubit(this.homeRepo) : super(UsersCubitInitial());
  void _fetchAllUsers(String currentUserId) async {
    emit(UsersCubitLoading());
    final result = homeRepo.getAllUsers(currentUserId);
    result.fold((failuer) => emit(UsersCubitFailure(failuer.message)), (
      usersStream,
    ) {
      usersStream.listen((users) {
        if (userSearchQuery != null && userSearchQuery!.isNotEmpty) {
          users = users
              .where(
                (user) => user.name.toLowerCase().contains(
                  userSearchQuery!.toLowerCase(),
                ),
              )
              .toList();
        }
        emit(UsersCubitSuccess(users));
      });
    });
  }

  void initialize(String currentUserId) {
    _fetchAllUsers(currentUserId);
  }

  void searchUsers(String query, String currentUserId) {
    userSearchQuery = query;
    _fetchAllUsers(currentUserId);
  }
}
