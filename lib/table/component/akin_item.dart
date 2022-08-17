import 'package:akin/model/product.dart';
import 'package:akin/model/table_data.dart';
import 'package:flutter/material.dart';

class AkinItem extends StatelessWidget {
  final ValueSetter<Product> valueSetter;
  final TableData data;
  final List<Product> products;
  const AkinItem(
      {Key? key,
      required this.data,
      required this.products,
      required this.valueSetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return Card(
            color: Colors.blueGrey.shade100,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      text: products[index].title,
                      style: TextStyle(
                          color: Colors.blueGrey.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0)),
                ),
                trailing: Text("${products[index].price} Ks",
                    style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  valueSetter(products[index]);
                },
              ),
            ),
          );
        }),
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: products.length);
  }
}
