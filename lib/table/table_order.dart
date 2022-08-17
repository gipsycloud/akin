import 'package:akin/model/product.dart';
import 'package:akin/model/table_data.dart';
import 'package:akin/table/component/akin_item.dart';
import 'package:akin/table/component/checkoutscreen.dart';
import 'package:flutter/material.dart';

class TableOrder extends StatefulWidget {
  final TableData data;
  final Product products;
  const TableOrder({Key? key, required this.data, required this.products})
      : super(key: key);

  @override
  State<TableOrder> createState() => _TableOrderState();
}

class _TableOrderState extends State<TableOrder> {
  List<Product> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(children: <Widget>[
          AkinItem(
              data: widget.data,
              products: products,
              valueSetter: (Product value) {
                setState(() {
                  cart.add(value);
                  sum = 0;
                  for (var element in cart) {
                    sum = sum + element.price;
                  }
                });
              }),
          CheckOutScreen(
            cart: cart,
            sum: sum = sum,
          ),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text("Total : $sum"),
          // icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(widget.data.title),
      bottom: const TabBar(tabs: <Widget>[
        Tab(
          text: "Product",
        ),
        Tab(
          text: "CheckOut",
        )
      ]),
      elevation: 0.0,
    );
  }
}
