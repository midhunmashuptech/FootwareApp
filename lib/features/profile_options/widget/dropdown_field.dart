import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  const DropdownField({
    super.key,
    required this.value,
    required this.hint,
    required this.items,
    required this.icon,
    required this.onChanged,
  });

  final String? value;
  final String hint;
  final List<String> items;
  final IconData icon;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        hint: Text(hint),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}