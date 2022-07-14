import 'package:akin/model/user.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddPersonForm extends StatefulWidget {
  const AddPersonForm({Key? key}) : super(key: key);

  @override
  State<AddPersonForm> createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {
  final _usernameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _amountController = TextEditingController();
  final _createddateController =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final _userFormKey = GlobalKey<FormState>();

  late final Box box;

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  // Add info to user box
  _addInfo() async {
    User newUser = User(
        username: _usernameController.text,
        phonenumber: _phonenumberController.text,
        amount: _amountController.text,
        createdDate: _createddateController.toLocal());
    box.add(newUser);
    // ignore: avoid_print
    print('Info added to box!');
  }

  @override
  void initState() {
    super.initState();
    //Get reference to an already opened box
    box = Hive.box('userBox');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _userFormKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('UserName'),
        TextFormField(
          controller: _usernameController,
          validator: _fieldValidator,
        ),
        const SizedBox(height: 24.0),
        const Text('Phone Number'),
        TextFormField(
          controller: _phonenumberController,
          validator: _fieldValidator,
        ),
        const Text('Amount'),
        TextFormField(
          controller: _amountController,
          validator: _fieldValidator,
        ),
        const Text('Date Time'),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
          child: SizedBox(
            width: double.maxFinite,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  if (_userFormKey.currentState!.validate()) {
                    _addInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add')),
          ),
        )
      ]),
    );
  }
}
