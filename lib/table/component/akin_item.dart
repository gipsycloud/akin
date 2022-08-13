import 'package:akin/model/product.dart';
import 'package:akin/model/table_data.dart';
import 'package:flutter/material.dart';

class AkinItem extends StatelessWidget {
  final TableData data;
  final List<Product> products;
  const AkinItem({Key? key, required this.data, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(products[index].title),
            trailing: Text("${products[index].price} Ks",
                style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          );
        }),
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: products.length);
  }
}
