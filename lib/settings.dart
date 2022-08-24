import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late ScrollController controller;
  List<String> items = List.generate(50, (index) => '$index');

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return Text(items[index]);
        },
        itemCount: items.length,
      ),
    );
  }

  void _scrollListener() {
    // ignore: avoid_print
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 500) {
      setState(() {
        items.addAll(List.generate(50, (index) => 'item $index'));
      });
    }
  }
}
