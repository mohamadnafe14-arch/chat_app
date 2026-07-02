import 'package:chat_app/features/home/presentation/views/widgets/chat_bubble.dart';
import 'package:chat_app/features/home/presentation/views/widgets/chat_bubble_for_friend.dart';
import 'package:flutter/material.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        if (index % 2 == 0) {
          return ChatBubble(message: "Hello, how are you?", time: "10:00 AM");
        } else {
          return FriendChatBubble(
            message: "I am fine, how about you?",
            time: "10:01 AM",
          );
        }
      },
      itemCount: 10,
    );
  }
}
