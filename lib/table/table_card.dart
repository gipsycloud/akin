import 'package:akin/model/table.dart';
// import 'package:akin/table/table_one.dart';
import 'package:akin/table/table_screen.dart';
import 'package:flutter/material.dart';

class TableCard extends StatelessWidget {
  const TableCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.purple, Colors.blue]),
      ),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: tables.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            Tablescreen(tables: tables[index]))));
              },
              child: Text(
                (tables[index].title),
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            );
            // return Image.asset(tables[index].image);
          },
        ),
      ),
    );
  }
}
