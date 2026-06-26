import 'package:chat_app/core/utils/app_router.dart';
import 'package:chat_app/features/auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void authListen(
  AuthCubitState state,
  BuildContext context,
  String successMessage,
) {
  if (state is AuthCubitSuccess) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(successMessage)));
    GoRouter.of(context).go(AppRouter.home);
  } else if (state is AuthCubitError) {
    final messenger = ScaffoldMessenger.of(context);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(state.message)));
  }
}
