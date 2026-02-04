import 'package:flutter/material.dart';

class AppNotification {
  final String title;
  final String description;
  final IconData icon;
  final String day; 

  AppNotification({
    required this.title,
    required this.description,
    required this.icon,
    required this.day,
  });
}
