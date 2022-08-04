import 'package:flutter/material.dart';

class Table {
  final String image, title, description;
  final int price, id;
  final Color color;
  Table({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.color,
  });
}

List<Table> tables = [
  Table(
      id: 1,
      title: "Table One",
      price: 234,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFF3D82AE)),
  Table(
      id: 2,
      title: "Table Two",
      price: 234,
      description: dummyText,
      image: "assets/images/two.png",
      color: const Color(0xFFD3A984)),
  Table(
      id: 3,
      title: "Table Three",
      price: 234,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFF989493)),
  Table(
      id: 4,
      title: "Table Four",
      price: 234,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFFE6B398)),
  Table(
      id: 5,
      title: "Table Five",
      price: 234,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFFFB7883)),
  Table(
    id: 6,
    title: "Table Six",
    price: 234,
    description: dummyText,
    image: "assets/images/one.png",
    color: const Color(0xFFAEAEAE), // Table
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
