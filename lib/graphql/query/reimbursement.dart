import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';

String getAllReimbursement = '''
  query Reimbursement {
    reimbursement {
      ${Reimbursement.attributes}
    }
  }

''';
