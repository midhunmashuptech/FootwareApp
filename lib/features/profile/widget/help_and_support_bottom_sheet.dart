import 'package:flutter/material.dart';
import 'package:footware_app/features/common/app_colors.dart';

class HelpAndSupportBottomSheet extends StatelessWidget {
  const HelpAndSupportBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.25,
      maxChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(20),
            children: [
              // drag handle
              Center(
                child: Container(
                  height: 4,
                  width: 40,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryLightGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const Center(
                child: Text(
                  "Contact Us at",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 24),
              Divider(color: AppColors.darkGrey,),
              const SizedBox(height: 24),
              _contactTile(
                icon: Icons.email_outlined,
                title: "Email",
                value: "support@souledstore.com",
              ),

              const SizedBox(height: 25),

              _contactTile(
                icon: Icons.call_outlined,
                title: "Mobile Number",
                value: "+91 7855332198",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _contactTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.darkGrey,
          child: Icon(icon, color: AppColors.primaryWhite),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: AppColors.primaryBlack)),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
