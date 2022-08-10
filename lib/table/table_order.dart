import 'package:akin/model/table_data.dart';
import 'package:akin/table/component/body.dart';
import 'package:flutter/material.dart';

class TableOrder extends StatefulWidget {
  final TableData data;
  const TableOrder({Key? key, required this.data}) : super(key: key);

  @override
  State<TableOrder> createState() => _TableOrderState();
}

class _TableOrderState extends State<TableOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Body(
          data: widget.data,
        ),
      ),
      // backgroundColor: widget.data.color,
      // appBar: buildAppBar(context),
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
