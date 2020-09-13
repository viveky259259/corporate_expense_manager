import 'package:corporate_expense_manager/models/statistics/all_statistics.dart';
import 'package:corporate_expense_manager/graphql/query/statistics.dart'
    as queries;
import 'package:corporate_expense_manager/models/user/user_local.dart';
import 'package:corporate_expense_manager/services/api_service.dart';

class StatisticsRepo {
  ApiService _apiService;

  StatisticsRepo._() {
    _apiService = ApiService();
  }

  static StatisticsRepo instance = StatisticsRepo._();

  Future<AllStaticss> getAll() async {
    var query = queries.getAllStats;
    var headers = await UserLocal.instance.getHeaders();
    var result = await _apiService.query(query, headers: headers);
    if (result != null &&
        result['reimbursement_aggregate'] != null &&
        result['reimbursement_aggregate']['aggregate'] != null) {
      int count = result['reimbursement_aggregate']['aggregate']['count'];
      int amount =
          result['reimbursement_aggregate']['aggregate']['max']['amount'];
      int totalAmount=result['reimbursement_aggregate']['aggregate']['sum']['amount'];
      return AllStaticss(maxAmount: amount, totalReimburseCount: count,totalAmountReimbursed: totalAmount);
    }
    return null;
  }
}
