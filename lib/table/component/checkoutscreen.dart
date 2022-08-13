import 'package:akin/model/product.dart';
import 'package:akin/model/table_data.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  final TableData data;
  final Product products;
  const CheckOutScreen({Key? key, required this.products, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
