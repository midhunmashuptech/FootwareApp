import 'package:flutter/material.dart';

class AddressTextField extends StatelessWidget {
  final String hint;
  final TextInputType keyboard;

  const AddressTextField({
    super.key,
    required this.hint,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        keyboardType: keyboard,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}