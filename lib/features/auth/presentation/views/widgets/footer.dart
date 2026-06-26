import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.firstText,
    required this.secondeText,
    required this.onPressed,
  });
  final String firstText, secondeText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(firstText, style: TextStyle(color: Colors.grey)),
        TextButton(
          onPressed: onPressed,
          child: Text(
            secondeText,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
