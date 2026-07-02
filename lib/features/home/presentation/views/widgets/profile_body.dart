import 'package:chat_app/core/utils/app_router.dart';
import 'package:chat_app/features/auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthCubit>().signOut();
          context.go(AppRouter.register);
        },
        child: Text("Sign out"),
      ),
    );
  }
}
