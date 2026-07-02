import 'package:chat_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ChatItemShimmer extends StatelessWidget {
  const ChatItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: grey.withValues(alpha: .25),
      highlightColor: Colors.white,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 6.h),
        color: grey.withValues(alpha: .08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
          side: BorderSide(color: grey.withValues(alpha: .15)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: Row(
            children: [
              /// Avatar
              Container(
                width: 56.w,
                height: 56.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),

              SizedBox(width: 14.w),

              /// Name + Message
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120.w,
                      height: 14.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Container(
                      width: double.infinity,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Container(
                      width: 180.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 16.w),

              /// Time + Badge
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 40.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),

                  SizedBox(height: 22.h),

                  Container(
                    width: 22.w,
                    height: 22.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
