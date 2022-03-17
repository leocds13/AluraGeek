import 'package:flutter/cupertino.dart';

class Product {
  final String title;
  final double price;
  final String description;
  final ImageProvider image;

  Product({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });
}
