import 'package:akin/order/add_screen.dart';
import 'package:akin/order/update_screen.dart';
import 'package:akin/settings.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final Box userBox;

  // _addInfo() async {
  //   // Storing key-value pair
  //   box.put('name', 'John');
  //   box.put('country', 'Italy');
  //   // ignore: avoid_print
  //   print('Info added to box!');
  // }

  // _getInfo() {
  //   // Read info from people box
  //   var name = box.get('username');
  //   var country = box.get('country');
  //   // ignore: avoid_print
  //   print('Info retrieved from box: $name ($country');
  // }

  // _updateInfo() {
  //   box.put('username', 'Mike');
  //   box.put('country', 'United States');
  //   // ignore: avoid_print
  //   print('Info updated in box!');
  // }

  _deleteInfo(int index) {
    userBox.deleteAt(index);
    // ignore: avoid_print
    print('Info deleted from box!');
  }

  @override
  void initState() {
    super.initState();
    //  Get reference to an already opened box
    userBox = Hive.box('userBox');
  }
  // @override
  // void dispose() {
  //   // closes all hive boxes
  //   Hive.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AKiN / add_category.dart'),
        leading: const Icon(Icons.fastfood_outlined),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
          valueListenable: userBox.listenable(),
          builder: (context, Box box, widget) {
            if (box.isEmpty) {
              return const Center(
                child: Text('Empty'),
              );
            } else {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  var currentBox = box;
                  var userData = currentBox.getAt(index);

                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdateScreen(index: index, user: userData),
                      ),
                    ),
                    child: ListTile(
                      title: Text(userData.username),
                      subtitle: Text(DateFormat('yyyy-MM-dd')
                          .format(userData.createdDate)),
                      trailing: IconButton(
                        onPressed: () => _deleteInfo(index),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}


// https://blog.logrocket.com/handling-local-data-persistence-flutter-hive/

// https://blog.logrocket.com/how-when-force-flutter-widget-rebuild/#updating-orders