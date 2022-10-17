import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class UserData extends ChangeNotifier {
  List<User> _userList = [];

  void addUser(user) {
    _userList.add(user);
    notifyListeners();
  }

  void deleteUser(user) {
    _userList.remove(user);
    notifyListeners();
  }

  List<User> get userList {
    return [..._userList];
  }
}
