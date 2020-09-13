import 'package:corporate_expense_manager/graphql/query/reimbursement.dart'
    as queries;
import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';
import 'package:corporate_expense_manager/models/user/user.dart';
import 'package:corporate_expense_manager/models/user/user_local.dart';
import 'package:corporate_expense_manager/models/user/user_types.dart';
import 'package:corporate_expense_manager/services/api_service.dart';
import '';

class ReimbursementRepo {
  static ReimbursementRepo instance = ReimbursementRepo._();
  ApiService _apiService;

  ReimbursementRepo._() {
    _apiService = ApiService();
  }

  Future<List<Reimbursement>> loadAllForMe() async {
    UserType userType = await UserLocal.instance.getType();
    var query = queries.getAllReimbursement;
    var headers = await UserLocal.instance.getHeaders();
    var result = await _apiService.query(query, headers: headers);
    if (result != null && result['reimbursement'] != null) {
      return Reimbursement.fromList(result['reimbursement']);
    } else
      return null;
  }

  Future<List<Reimbursement>> loadAllForOthers() async {
    var query = queries.getAllHRReimbursement;
    var headers = await UserLocal.instance.getEmptyHeaders();

    var result = await _apiService.query(query, headers: headers);

    if (result != null && result['reimbursement'] != null) {
      return Reimbursement.fromList(result['reimbursement']);
    } else
      return null;
  }

  Future<bool> updateStatus(String status, String id) async {
    if (id == null || status == null) return false;
    var query = queries.updateStatus;
    var variables = {"status": status, "id": id};
    var headers = await UserLocal.instance.getHeaders();

    var result = await _apiService.mutation(query, variables, headers: headers);
    if (result != null || result['update_reimbursement'] != null)
      return true;
    else
      return false;
  }
}
