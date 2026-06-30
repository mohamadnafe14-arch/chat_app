import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/core/styles/styles.dart';
import 'package:chat_app/features/home/presentation/views/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 50.h)),
          SliverToBoxAdapter(child: Text("Chat", style: large)),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          SliverToBoxAdapter(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search from here",
                fillColor: grey.withValues(alpha: .2),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Container(
                  color: primary,
                  child: Image.asset(searchIcon, width: 20, height: 20),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          ChatList(),
        ],
      ),
    );
  }
}
