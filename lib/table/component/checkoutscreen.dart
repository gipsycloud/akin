// ignore_for_file: deprecated_member_use

import 'package:akin/model/product.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final cart;
  // ignore: prefer_typing_uninitialized_variables
  final sum;
  final ValueSetter<Product> valueDeleter;
  const CheckOutScreen(
      {Key? key, this.cart, this.sum, required this.valueDeleter})
      : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: widget.cart.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    IconButton(
                        onPressed: () =>
                            widget.valueDeleter(widget.cart[index]),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        )),
                    Text(widget.cart[index].title),
                  ],
                ),
                trailing: Text(
                  "${widget.cart[index].price}",
                  style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              );
            },
          ),
        ),
        Container(
            color: Colors.blue,
            height: 43.0,
            width: MediaQuery.of(context).size.width,
            child: OutlineButton(
              onPressed: () {
                // ignore: avoid_print
                print('Order Now');
              },
              child: const Text(
                'Order Now',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            )),
      ],
    );
  }
}
