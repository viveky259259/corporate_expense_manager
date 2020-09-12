import 'package:corporate_expense_manager/models/user/user.dart';

String loginUser = '''
query LoginUser(\$userId: String!, \$password: String!) {
  user(where: {user_id: {_eq: \$userId}, password: {_eq: \$password}},limit:1) {
    ${User.attributes}
  }
}

''';
