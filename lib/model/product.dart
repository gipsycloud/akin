import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 100,
      size: 12,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 1500,
      size: 8,
      description: dummyText,
      image: "assets/images/two.png",
      color: const Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
      price: 500,
      size: 10,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 250,
      size: 11,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Grand Royal",
      price: 600,
      size: 12,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Alibaba",
    price: 3000,
    size: 12,
    description: dummyText,
    image: "assets/images/one.png",
    color: const Color(0xFFAEAEAE),
  ),
  Product(
    id: 7,
    title: "Facebook",
    price: 1000,
    size: 12,
    description: dummyText,
    image: "assets/images/one.png",
    color: const Color(0xFFAEAEAE),
  ),
  Product(
    id: 8,
    title: "Twitter",
    price: 7000,
    size: 12,
    description: dummyText,
    image: "assets/images/one.png",
    color: const Color(0xFFAEAEAE),
  ),
  Product(
    id: 9,
    title: "Github",
    price: 7000,
    size: 12,
    description: dummyText,
    image: "assets/images/one.png",
    color: const Color(0xFFAEAEAE),
  ),
  Product(
    id: 10,
    title: "Bitbucket",
    price: 7000,
    size: 12,
    description: dummyText,
    image: "assets/images/one.png",
    color: const Color(0xFFAEAEAE),
  ),
  Product(
    id: 11,
    title: "Google",
    price: 7000,
    size: 12,
    description: dummyText,
    image: "assets/images/one.png",
    color: const Color(0xFFAEAEAE),
  ),
  Product(
    id: 12,
    title: "Yahoo",
    price: 7000,
    size: 12,
    description: dummyText,
    image: "assets/images/one.png",
    color: const Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
