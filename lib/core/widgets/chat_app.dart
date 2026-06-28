import 'package:chat_app/core/utils/app_router.dart';
import 'package:chat_app/features/auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => serviceLocator<AuthCubit>()..getCurrentUser(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Chat App',
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
