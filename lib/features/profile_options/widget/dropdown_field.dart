import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  const DropdownField({
    super.key,
    required this.value,
    required this.label,
    required this.hint,
    required this.items,
    required this.icon,
    required this.onChanged,
  });

  final String? value;
  final String label;
  final String hint;
  final List<String> items;
  final IconData icon;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
           value: items.contains(value) ? value : null,
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
        ],
      ),
    );
  }
}