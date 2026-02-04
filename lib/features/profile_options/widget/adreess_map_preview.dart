import 'package:flutter/material.dart';

/// 🗺 MAP PREVIEW WIDGET
class AddressMapPreview extends StatelessWidget {
  const AddressMapPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Image.network(
          "https://developers.google.com/static/maps/images/landing/hero_maps_static_api.png",
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (_, __, ___) => Container(
            color: Colors.grey.shade300,
            child: const Center(child: Icon(Icons.map, size: 50)),
          ),
        ),
      ),
    );
  }
}