// ignore_for_file: deprecated_member_use

import 'package:akin/order/order.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // The indicator will show up when _isLoading = true.
  // The button will be unpressable, too.
  bool _isLoading = false;

  //This function will be triggered when the button is pressed
  void _startLoading() async {
    setState(() {
      _isLoading = true;
    });
    // Wait for 3 seconds
    // You can replace this with your own task like fetching data, processing images, etc
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Order()));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
          child: ElevatedButton.icon(
              onPressed: _isLoading ? null : _startLoading,
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100)),
              icon: _isLoading
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.add),
              label: Text(
                _isLoading ? 'Loading ...' : 'Start',
                style: const TextStyle(fontSize: 30.0),
              ))),
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
          showOverlayNotification((context) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: SafeArea(
                child: ListTile(
                  leading: SizedBox.fromSize(
                      size: const Size(40, 40),
                      child: ClipOval(
                          child: Image.asset(
                        'assets/images/one.png',
                        fit: BoxFit.cover,
                      ))),
                  title: const Text('Add New Items in Checkout'),
                  // subtitle: const Text('Thanks for checking out my tutorial'),
                  trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        OverlaySupportEntry.of(context)?.dismiss();
                      }),
                ),
              ),
            );
          }, duration: const Duration(milliseconds: 4000));
        },
        child: const Icon(Icons.send), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.redAccent,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.sync,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// // import 'package:hive_flutter/hive_flutter.dart';

// class Settings extends StatefulWidget {
//   const Settings({Key? key}) : super(key: key);

//   @override
//   State<Settings> createState() => _SettingsState();
// }

// class _SettingsState extends State<Settings> {
//   late ScrollController controller;
//   List<String> items = List.generate(50, (index) => '$index');

//   @override
//   void initState() {
//     super.initState();
//     controller = ScrollController()..addListener(_scrollListener);
//   }

//   @override
//   void dispose() {
//     controller.removeListener(_scrollListener);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         controller: controller,
//         itemBuilder: (context, index) {
//           return Text(items[index]);
//         },
//         itemCount: items.length,
//       ),
//     );
//   }

//   void _scrollListener() {
//     // ignore: avoid_print
//     print(controller.position.extentAfter);
//     if (controller.position.extentAfter < 500) {
//       setState(() {
//         items.addAll(List.generate(50, (index) => 'item $index'));
//       });
//     }
//   }
// }
