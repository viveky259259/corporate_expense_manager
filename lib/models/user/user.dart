//class User {
//  User _user;
//
//  User({User user}) {
//    this._user = user;
//  }
//
//  User get user => _user;
//  set user(User user) => _user = user;
//
//  User.fromJson(Map<String, dynamic> json) {
//    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this._user != null) {
//      data['user'] = this._user.toJson();
//    }
//    return data;
//  }
//}
import 'package:corporate_expense_manager/services/date_time_service.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String _firstName;
  @HiveField(1)
  String _lastName;
  @HiveField(2)
  String _type;
  @HiveField(3)
  String _userId;
  DateTime _createdAt;
  DateTime _updatedAt;

  User(
      {String firstName,
      String lastName,
      String type,
      String userId,
      DateTime createdAt,
      DateTime updatedAt}) {
    this._firstName = firstName;
    this._lastName = lastName;
    this._type = type;
    this._userId = userId;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  static String get attributes {
    return '''
      first_name
      last_name
      type
      user_id
    ''';
  }

  String get firstName => _firstName;

  set firstName(String firstName) => _firstName = firstName;

  String get lastName => _lastName;

  set lastName(String lastName) => _lastName = lastName;

  String get type => _type;

  set type(String type) => _type = type;

  String get userId => _userId;

  set userId(String userId) => _userId = userId;

  DateTime get createdAt => _createdAt;

  set createdAt(DateTime createdAt) => _createdAt = createdAt;

  DateTime get updatedAt => _updatedAt;

  set updatedAt(DateTime updatedAt) => _updatedAt = updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _type = json['type'];
    _userId = json['user_id'];
    _createdAt = DateTimeService.fromString(json['created_at']);
    _updatedAt = DateTimeService.fromString(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['type'] = this._type;
    data['user_id'] = this._userId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
