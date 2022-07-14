import 'package:akin/model/user.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<User> getUsers() => Hive.box<User>('Users');
}
