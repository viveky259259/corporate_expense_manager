import 'package:corporate_expense_manager/graphql/query/reimbursement.dart'
    as queries;
import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';
import 'package:corporate_expense_manager/models/user/user.dart';
import 'package:corporate_expense_manager/models/user/user_local.dart';
import 'package:corporate_expense_manager/services/api_service.dart';
import '';

class ReimbursementRepo {
  static ReimbursementRepo instance = ReimbursementRepo._();
  ApiService _apiService;

  ReimbursementRepo._() {
    _apiService = ApiService();
  }

  Future<List<Reimbursement>> loadAll() async {
    var query = queries.getAllReimbursement;
    var headers = await UserLocal.instance.getHeaders();
    var result = await _apiService.query(query, headers: headers);
    if (result != null && result['reimbursement'] != null) {
      return Reimbursement.fromList(result['reimbursement']);
    } else
      return null;
  }
}
