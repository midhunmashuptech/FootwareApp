import 'package:flutter/material.dart';
import 'package:footware_app/features/common/app_colors.dart';

class DetailItem extends StatelessWidget {
  final String label;
  final String value;
  const DetailItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: AppColors.darkGrey)),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        Divider(color: AppColors.secondaryGrey),
      ],
    );
  }
}
