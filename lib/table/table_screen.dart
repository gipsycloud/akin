import 'package:akin/add_category.dart';
import 'package:akin/table/table_card.dart';
import 'package:flutter/material.dart';

class Tablescreen extends StatefulWidget {
  const Tablescreen({
    Key? key,
    required this.tables,
  }) : super(key: key);

  final List<Tablescreen> tables;

  @override
  State<Tablescreen> createState() => _TablescreenState();
}

class _TablescreenState extends State<Tablescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.tag_faces_sharp),
          title: const Text('AKiN'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                icon: const Icon(Icons.menu))
          ],
          elevation: 0.0,
        ),
        body: const TableCard());
  }
}
