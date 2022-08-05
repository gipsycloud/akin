import 'package:akin/model/product.dart';
import 'package:akin/screen/body.dart';
import 'package:akin/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Details extends StatefulWidget {
  final Product product;

  const Details({Key? key, required this.product}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: widget.product.color,
      appBar: buildAppBar(context),
      body: Body(product: widget.product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: widget.product.color,
      elevation: 0.0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          width: 25.0,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            width: 23.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/shopping-cart.svg",
            width: 23.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
