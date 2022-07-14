import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final String phonenumber;

  @HiveField(2)
  final String amount;

  @HiveField(3)
  final DateTime createdDate;

  User(
      {required this.username,
      required this.phonenumber,
      required this.amount,
      required this.createdDate});
}

// @HiveType(typeId: 0)
// class User extends HiveObject {
//   late String username;
//   late String phonenumber;
//   late double amount;
//   late DateTime createdDate;

//   // User(this.username, this.phonenumber);
// }
