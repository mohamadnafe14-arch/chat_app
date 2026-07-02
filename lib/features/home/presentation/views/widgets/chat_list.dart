import 'package:chat_app/features/home/presentation/viewmodel/users_cubit/users_cubit_cubit.dart';
import 'package:chat_app/features/home/presentation/views/widgets/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersCubitState>(
      builder: (context, state) {
        if (state is UsersCubitLoading) {
          return SliverToBoxAdapter(
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is UsersCubitFailure) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                state.message,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          );
        } else if (state is UsersCubitSuccess) {
          final users = state.users;
          if (users.isEmpty) {
            return SliverFillRemaining(
              child: const Center(child: Text('No users found.')),
            );
          }
          return SliverList.separated(
            itemBuilder: (context, index) {
              final user = users[index];
              return ChatItem(userModel: user);
            },
            separatorBuilder: (context, index) =>
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            itemCount: users.length,
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
