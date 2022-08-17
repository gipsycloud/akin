import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final cart;
  // ignore: prefer_typing_uninitialized_variables
  final sum;
  const CheckOutScreen({Key? key, this.cart, this.sum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.separated(
          itemCount: cart.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cart[index].title),
              trailing: Text(
                "${cart[index].price}",
                style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {},
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
        const Divider(),
        Text("Total : \$$sum"),
      ],
    );
  }
}
