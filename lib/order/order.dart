import 'package:akin/model/product.dart';
import 'package:akin/order/item_card.dart';
import 'package:akin/screen/details.dart';
import 'package:akin/settings.dart';
import 'package:akin/widget/constants.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.tag_faces_sharp),
          title: const Text('AKiN / Order.dart'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Settings()));
                },
                icon: const Icon(Icons.menu))
          ],
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: kDefaultPadding,
                              crossAxisCount: 2,
                              childAspectRatio: 0.75),
                      itemBuilder: (context, index) => ItemCard(
                            product: products[index],
                            press: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Details(product: products[index])));
                            },
                          )),
                )),
          ],
        ));
  }
}























// body: GridView.count(
      //   crossAxisCount: 2,
      //   children: List.generate(6, (index) {
      //     // return Center(
      //     //   child: Container(
      //     //     decoration: BoxDecoration(
      //     //       border: Border.all(color: Colors.grey, width: 3.0),
      //     //     ),
      //     //     padding: const EdgeInsets.all(16.0),
      //     //     child: Text(
      //     //       'Table $index',
      //     //       style: Theme.of(context).textTheme.headline5,
      //     //     ),
      //     //   ),
      //     // );
      //     return Column(
      //       children: <Widget>[
      //         Container(
      //           padding: const EdgeInsets.all(kDefaultPadding),
      //           height: 180.0,
      //           width: 160.0,
      //           decoration: BoxDecoration(
      //               color: products[0].color,
      //               borderRadius: BorderRadius.circular(16.0)),
      //           child: Image.asset(products[0].image),
      //         ),
      //         Text(products[0].title)
      //       ],
      //     );
      //   }),
      // ),