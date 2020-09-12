import 'package:corporate_expense_manager/graphql/query/user.dart' as queries;
import 'package:corporate_expense_manager/models/user/user.dart';
import 'package:corporate_expense_manager/services/api_service.dart';
import 'package:meta/meta.dart' show required;

class UserRepo {
  static UserRepo instance = UserRepo._();
  ApiService _apiService;

  UserRepo._() : _apiService = ApiService();

  Future<User> loginUser({@required String userId, @required password}) async {
    var variable = {"userId": userId, "password": password};
    var query = queries.loginUser;

    var result = await _apiService.query(query, variables: variable);
    if (result != null && result['user'] != null) {
      return User.fromJson(result['user'][0]);
    }
    return null;
  }


}
