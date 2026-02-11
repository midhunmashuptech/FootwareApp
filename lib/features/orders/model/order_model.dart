import 'package:flutter/material.dart';

enum OrderStatus { active, completed }
enum TrackingStage {
  placed,
  shipped,
  outForDelivery,
  delivered,
}


class OrderModel {
  final String id;
  final String title;
  final String subtitle;
  final OrderStatus status;
  final String size;
  final int price;
  final String imagePath;
  final bool isAsset;
  final List<Color> colors;
  final String deliveryText;
  final TrackingStage trackingStage;
  final Function() onPressed;

  OrderModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.size,
    required this.price,
    required this.imagePath,
    required this.isAsset,
    required this.colors,
    required this.deliveryText,
    required this.trackingStage,
    required this.onPressed
  });
}
