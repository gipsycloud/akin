import 'package:akin/model/product.dart';
import 'package:akin/model/table_data.dart';
// import 'package:akin/screen/body.dart';
import 'package:flutter/material.dart';
// import 'package:overlay_support/overlay_support.dart';

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
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Card(
                color: Colors.blueGrey.shade100,
                // elevation: 3.0,
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
                    trailing: Text(
                      "${products[index].price} Ks",
                    ),
                    onTap: () {
                      valueSetter(products[index]);
                    }),
              );
            }),
            itemCount: products.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
        Container(
          color: Colors.blue,
          height: 43.0,
        )
      ]),
    );
  }
}
