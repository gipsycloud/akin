import 'package:akin/model/table_data.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final TableData data;
  const Body({Key? key, required this.data}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: Column(children: <Widget>[Text(widget.data.title)]),
        );

    // return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: Text(widget.data.title),
    //         bottom: const TabBar(tabs: <Widget>[
    //           Tab(
    //             text: "Products",
    //           ),
    //           Tab(
    //             text: 'CheckOut',
    //           )
    //         ]),
    //       ),
    //     ));
  }
}
