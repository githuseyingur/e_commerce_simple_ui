import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Product{
  final String name, image;
  final double price;

  Product(this.name, this.price, this.image);
}

List<Product> products = [
  Product("Track Suit", 139.99, "assets/cardImage1.png"),
  Product("Oversized Hoodie", 89.99, "assets/cardImage2.png"),
  Product("Oversized Hoodie", 89.99,"assets/cardImage3.png"),
  Product("Reflector Hoodie", 89.99, "assets/cardImage4.png"),
  Product("Track Suit", 139.99, "assets/cardImage5.png"),
  Product("Oversized Hoodie", 89.99, "assets/cardImage6.png"),
];