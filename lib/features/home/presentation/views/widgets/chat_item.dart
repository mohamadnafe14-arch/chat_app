import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/styles/styles.dart';
import 'package:chat_app/core/utils/app_router.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.chat, extra: userModel);
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
            child: userModel.photoUrl == ""
                ? Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  )
                : Image.network(
                    userModel.photoUrl!,
                    width: 56.w,
                    height: 56.w,
                    fit: BoxFit.cover,
                  ),
          ),
          title: Text(
            userModel.name,
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
