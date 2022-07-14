import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: Column(children: <Widget>[
        Expanded(child: _buildListView()),
        // NewContactForm(),
      ]),
    );
  }

  ListView _buildListView() {
    return ListView(
      children: const <Widget>[],
    );
  }
}
