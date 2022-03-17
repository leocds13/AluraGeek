import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? minLines;

  const CustomTextField({
    Key? key,
    required this.keyboardType,
    this.labelText,
    this.hintText,
    this.controller,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: null,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color(0xffa2a2a2),
          fontSize: 16,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xffa2a2a2),
          fontSize: 16,
        ),
        floatingLabelStyle: const TextStyle(
          color: Color(0xffa2a2a2),
          fontSize: 16,
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
