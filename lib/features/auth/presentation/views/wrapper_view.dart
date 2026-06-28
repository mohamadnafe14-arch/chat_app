import 'package:chat_app/core/utils/app_router.dart';
import 'package:chat_app/features/auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WrapperView extends StatelessWidget {
  const WrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is AuthCubitSuccess) {
          GoRouter.of(context).go(AppRouter.home);
        } else {
          GoRouter.of(context).go(AppRouter.register);
        }
      },
      child: const Scaffold(),
    );
  }
}
