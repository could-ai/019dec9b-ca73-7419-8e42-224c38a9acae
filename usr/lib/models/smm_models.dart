import 'package:flutter/material.dart';

class PlatformCategory {
  final String id;
  final String name;
  final String iconCode;
  final List<Color> gradientColors;

  const PlatformCategory({
    required this.id,
    required this.name,
    required this.iconCode,
    required this.gradientColors,
  });
}

class ServicePackage {
  final String id;
  final String platformId;
  final String title;
  final String description;
  final double price;
  final String deliveryTime;
  final int minQuantity;
  final int maxQuantity;

  const ServicePackage({
    required this.id,
    required this.platformId,
    required this.title,
    required this.description,
    required this.price,
    required this.deliveryTime,
    required this.minQuantity,
    required this.maxQuantity,
  });
}

enum OrderStatus { pending, inProgress, completed, cancelled }

class Order {
  final String id;
  final String packageId;
  final String link;
  final int quantity;
  final double totalPrice;
  final OrderStatus status;
  final DateTime date;

  const Order({
    required this.id,
    required this.packageId,
    required this.link,
    required this.quantity,
    required this.totalPrice,
    required this.status,
    required this.date,
  });
}
