import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(color: grey),
      ),
      color: grey.withValues(alpha: .2),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 30.r,
          backgroundImage: const NetworkImage(
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
          ),
        ),
        title: Text(
          "User 1",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: medium,
        ),
        subtitle: Text(
          "Hello 1",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: small.copyWith(color: Colors.grey),
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("2:00 PM", style: small.copyWith(color: Colors.grey)),
            SizedBox(height: 5.h),
            CircleAvatar(
              radius: 10.r,
              backgroundColor: primary,
              child: Text("2", style: small.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
