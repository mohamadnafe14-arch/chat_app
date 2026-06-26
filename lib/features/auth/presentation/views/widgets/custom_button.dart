import 'package:chat_app/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.loading,
  });
  final String text;
  final void Function()? onPressed;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.black,
      ),
      onPressed: onPressed,
      child: loading
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
