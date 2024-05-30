import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.controller,
    this.error,
    this.hintText,
  });

  final TextEditingController controller;
  final String? error, hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            errorText: error,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
      ),
    );
  }
}
