import 'package:flutter/material.dart';

class TableOne extends StatefulWidget {
  const TableOne({Key? key}) : super(key: key);

  @override
  State<TableOne> createState() => _TableOneState();
}

class _TableOneState extends State<TableOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table One'),
      ),
      body: Container(),
    );
  }
}
