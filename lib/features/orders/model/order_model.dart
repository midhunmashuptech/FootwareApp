import 'package:flutter/material.dart';

enum OrderStatus { active, completed }

class OrderModel {
  final String title;
  final String subtitle;
  final OrderStatus status;
  final String size;
  final int price;
  final String imagePath;
  final bool isAsset;
  final List<Color> colors;
  final String deliveryText;
  final Function() onPressed;

  OrderModel({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.size,
    required this.price,
    required this.imagePath,
    required this.isAsset,
    required this.colors,
    required this.deliveryText,
    required this.onPressed
  });
}
