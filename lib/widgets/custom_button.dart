import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  const CustomButton(
      {super.key, required this.onTap, required this.textButton});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            textButton,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
