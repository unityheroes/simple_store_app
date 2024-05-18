import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String textHint;
  bool obsecureText;
  TextInputType? textInputType;
  Function(String)? onChange;
  CustomTextField(
      {super.key,
      this.obsecureText = false,
      required this.onChange,
      required this.textHint,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obsecureText,
        onChanged: onChange,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: textHint,

          //labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.red)),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ));
  }
}
