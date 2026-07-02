import 'package:chat_app/features/auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/home/data/repos/home_repo.dart';
import 'package:chat_app/features/home/presentation/viewmodel/users_cubit/users_cubit_cubit.dart';
import 'package:chat_app/features/home/presentation/views/widgets/chat_body.dart';
import 'package:chat_app/features/home/presentation/views/widgets/others_body.dart';
import 'package:chat_app/features/home/presentation/views/widgets/profile_body.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final userModel =
        (context.read<AuthCubit>().state as AuthCubitSuccess).user;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          OthersBody(),
          BlocProvider(
            create: (context) =>
                UsersCubit(serviceLocator<HomeRepo>())
                  ..initialize(userModel.uid),
            child: ChatBody(currentUserId: userModel.uid),
          ),
          ProfileBody(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5, -5),
              blurRadius: 5,
            ),
            BoxShadow(color: Colors.grey, offset: Offset(5, 5), blurRadius: 5),
          ],
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/home_icon.png"),
                height: 30,
                width: 30,
              ),
              label: "other",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/chats_icon.png"),
                height: 30,
                width: 30,
              ),
              label: "chats",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/profile_icon.png"),
                height: 30,
                width: 30,
              ),
              label: "profile",
            ),
          ],
        ),
      ),
    );
  }
}
