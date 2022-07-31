import 'package:akin/model/product.dart';
import 'package:akin/widget/constants.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Image.asset(product.image),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
              child: Text(
                product.title,
                style: const TextStyle(color: kTextLightColor),
              ),
            ),
            Text("\$${product.price} item_card.dart",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ))
          ]),
    );
  }
}
