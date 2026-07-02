import 'package:chat_app/features/home/presentation/views/widgets/chat_item_shimmer.dart';
import 'package:flutter/material.dart';

class ChatListShimmer extends StatelessWidget {
  const ChatListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return ChatItemShimmer();
      },
      separatorBuilder: (context, index) =>
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      itemCount: 10,
    );
  }
}
