import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/styles/styles.dart';
import 'package:chat_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.chat);
      },
      child: Card(
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 6.h),
        color: grey.withValues(alpha: .08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
          side: BorderSide(color: grey.withValues(alpha: .15)),
        ),
        child: ListTile(
          minVerticalPadding: 12.h,
          contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Image.network(
              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
              width: 56.w,
              height: 56.w,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            "User 1",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: medium.copyWith(fontWeight: FontWeight.w600),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              "Hello, how are you doing today?",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: small.copyWith(color: Colors.grey.shade700),
            ),
          ),
          trailing: SizedBox(
            width: 50.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "2:00 PM",
                  style: small.copyWith(color: Colors.grey, fontSize: 11.sp),
                ),
                const Spacer(),
                Container(
                  width: 22.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
