import 'package:akin/model/user.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UpdateUserForm extends StatefulWidget {
  final int index;
  final User user;

  const UpdateUserForm({
    Key? key,
    required this.index,
    required this.user,
  }) : super(key: key);

  @override
  State<UpdateUserForm> createState() => _UpdateUserFormState();
}

class _UpdateUserFormState extends State<UpdateUserForm> {
  final _userFormKey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  late final _usernameController;
  // ignore: prefer_typing_uninitialized_variables
  late final _phonenumberController;
  // ignore: prefer_typing_uninitialized_variables
  late final _amountController;
  late final _createddateController =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  late final Box box;

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  _updateInfo() {
    User newUser = User(
      username: _usernameController.text,
      amount: _amountController.text,
      phonenumber: _phonenumberController.text,
      createdDate: _createddateController.toLocal(),
    );
    box.putAt(widget.index, newUser);
    // ignore: avoid_print
    print('Info update in box');
  }

  @override
  void initState() {
    super.initState();
    // Get Reference to an already oped box
    box = Hive.box('userBox');
    // show the current values
    _usernameController = TextEditingController(text: widget.user.username);
    _phonenumberController =
        TextEditingController(text: widget.user.phonenumber);
    _amountController = TextEditingController(text: widget.user.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _userFormKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('UserName'),
            TextFormField(
              controller: _usernameController,
              validator: _fieldValidator,
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text('Phone Number'),
            TextFormField(
              controller: _phonenumberController,
              validator: _fieldValidator,
            ),
            TextFormField(
              controller: _amountController,
              validator: _fieldValidator,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
              child: SizedBox(
                width: double.maxFinite,
                height: 50.0,
                child: ElevatedButton(
                    onPressed: () {
                      if (_userFormKey.currentState!.validate()) {
                        _updateInfo();
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Update')),
              ),
            )
          ]),
    );
  }
}
