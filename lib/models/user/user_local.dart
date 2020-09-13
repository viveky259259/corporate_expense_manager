import 'package:corporate_expense_manager/models/user/user.dart';
import 'package:corporate_expense_manager/models/user/user_types.dart';
import 'package:hive/hive.dart';

class UserLocal {
  static UserLocal instance = UserLocal._();
  Box _userBox;

  UserLocal._() {
    openUserBox();
  }

  Future<void> openUserBox() async {
    try {
      if (_userBox == null || !_userBox.isOpen)
        _userBox = await Hive.openBox("user");
    } catch (e) {
      print(e);
    }
  }

  Future<User> getLocalUser() async {
    if (_userBox == null) await openUserBox();
    List<User> list = _userBox.toMap().values.toList().cast<User>();
    if (list == null || list.length == 0) return null;
    return list[0];
  }

  Future<Map<String, dynamic>> getHeaders() async {
    User user = await getLocalUser();
    var header = {"x-hasura-user-id": user.userId, "x-hasura-role": user.type};
    return header;
  }

  Future<UserType> getType() async {
    User user = await getLocalUser();

    return UserTypeHelper.getTypeFromString(user.type);
  }

  Future<Map<String, dynamic>> getEmptyHeaders() async {
    var header = {"x-hasura-user-id": '', "x-hasura-role": ''};
    return header;
  }

  Future<void> saveUser(User user) async {
    try {
      if (_userBox == null) await openUserBox();
      if (_userBox.values.toList().length > 0 && user != null)
        await _userBox.clear();
      await _userBox.add(user);
      return true;
    } catch (e) {
      return false;
    }
  }
}
