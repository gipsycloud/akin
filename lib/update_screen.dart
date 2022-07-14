import 'package:akin/model/user.dart';
import 'package:akin/util/update_user_form.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  // const UpdateScreen({Key? key}) : super(key: key);

  final int index;
  final User user;

  // ignore: use_key_in_widget_constructors
  const UpdateScreen({
    required this.index,
    required this.user,
  });

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UpdateUserForm(index: widget.index, user: widget.user),
      ),
    );
  }
}
