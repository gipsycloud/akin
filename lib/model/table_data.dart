import 'package:flutter/material.dart';

class TableData {
  final String image, title, description;
  final int price, id;
  final Color color;
  TableData({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.color,
  });
}

List<TableData> tabledata = [
  TableData(
      id: 1,
      title: "Table One",
      price: 234,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFF3D82AE)),
  TableData(
      id: 2,
      title: "Table Two",
      price: 234,
      description: dummyText,
      image: "assets/images/two.png",
      color: const Color(0xFFD3A984)),
  TableData(
      id: 3,
      title: "Table Three",
      price: 234,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFF989493)),
  TableData(
      id: 4,
      title: "Table Four",
      price: 234,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFFE6B398)),
  TableData(
      id: 5,
      title: "Table Five",
      price: 234,
      description: dummyText,
      image: "assets/images/one.png",
      color: const Color(0xFFFB7883)),
  TableData(
    id: 6,
    title: "Table Six",
    price: 234,
    description: dummyText,
    image: "assets/images/one.png",
    color: const Color(0xFFAEAEAE), // TableData
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
