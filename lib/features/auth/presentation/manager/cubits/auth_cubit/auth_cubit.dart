import 'package:chat_app/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit(this.authRepo) : super(AuthCubitInitial());
  final AuthRepo authRepo;
  void login({required String email, required String password}) async {
    emit(AuthCubitLoading());
    final result = await authRepo.login(email, password);
    result.fold(
      (failuer) => emit(AuthCubitError(failuer.message)),
      (user) => emit(AuthCubitSuccess(user)),
    );
  }

  void register({required String email, required String password}) async {
    emit(AuthCubitLoading());
    final result = await authRepo.register(email, password);
    result.fold(
      (failuer) => emit(AuthCubitError(failuer.message)),
      (user) => emit(AuthCubitSuccess(user)),
    );
  }

  void logout() async {
    emit(AuthCubitLoading());
    final result = await authRepo.logout();
    result.fold(
      (failuer) => emit(AuthCubitError(failuer.message)),
      (unit) => emit(AuthCubitInitial()),
    );
  }

  void getCurrentUser() async {
    emit(AuthCubitLoading());
    final result = authRepo.getCurrentUser();
    result.fold(
      (failuer) => emit(AuthCubitError(failuer.message)),
      (user) => user == null
          ? emit(AuthCubitInitial())
          : emit(AuthCubitSuccess(user)),
    );
  }
}
