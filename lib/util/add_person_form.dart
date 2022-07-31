import 'package:akin/model/user.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class AddPersonForm extends StatefulWidget {
  const AddPersonForm({Key? key}) : super(key: key);

  @override
  State<AddPersonForm> createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {
  final _usernameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _amountController = TextEditingController();
  final _createddateController = DateTime.now();
  // DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final _userFormKey = GlobalKey<FormState>();

  Function? onSubmit;
  Function? onChange;

  late final Box box;

  TextEditingController dateinput = TextEditingController();

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
          autofocus: true,
          onFieldSubmitted:
              onSubmit?.call(), // Using ?.call to check if null before calling
          onChanged: onChange?.call(),
          // inputFormatters: [],
        ),
        const SizedBox(height: 24.0),
        const Text('Phone Number'),
        TextFormField(
          controller: _phonenumberController,
          validator: _fieldValidator,
          keyboardType: TextInputType.number,
          onFieldSubmitted:
              onSubmit?.call(), // Using ?.call to check if null before calling
          onChanged: onChange?.call(),
        ),
        const SizedBox(height: 24.0),
        const Text('Amount'),
        TextFormField(
          controller: _amountController,
          validator: _fieldValidator,
          keyboardType: TextInputType.number,
          onFieldSubmitted:
              onSubmit?.call(), // Using ?.call to check if null before calling
          onChanged: onChange?.call(),
        ),
        const SizedBox(height: 24.0),
        const Text('Date Time'),
        TextFormField(
          onFieldSubmitted:
              onSubmit?.call(), // Using ?.call to check if null before calling
          onChanged: onChange?.call(),
          controller: dateinput,
          decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today), labelText: 'Enter Date'),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                cancelText: 'Not now',
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101));
            if (pickedDate != null) {
              // ignore: avoid_print
              print('pickedDate' + pickedDate.toString());
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              // ignore: avoid_print
              print('formattedDate' + formattedDate);
              setState(() {
                dateinput.text = formattedDate;
              });
            } else {
              // ignore: avoid_print
              print('Date is not selected');
            }
          },
        ),
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

// https://stackoverflow.com/questions/63346008/flutter-dart-format-date-in-input-form