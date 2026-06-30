import 'package:chat_app/features/home/presentation/views/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return ChatItem();
      },
      separatorBuilder: (context, index) =>
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      itemCount: 10,
    );
  }
}
