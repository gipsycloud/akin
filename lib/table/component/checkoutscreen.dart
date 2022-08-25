import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final cart;
  // ignore: prefer_typing_uninitialized_variables
  final sum;
  const CheckOutScreen({Key? key, this.cart, this.sum}) : super(key: key);

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
                title: Text(widget.cart[index].title),
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
            // separatorBuilder: (BuildContext context, int index) {
            //   return const Divider();
            // },
          ),
        ),
        Container(
          color: Colors.blue,
          height: 43.0,
          width: MediaQuery.of(context).size.width,
          // child: Text("Total : \$${widget.sum}"),
        ),
      ],
    );
  }
}
