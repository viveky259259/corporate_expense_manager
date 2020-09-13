import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';

String getAllReimbursement = '''
  query Reimbursement {
    reimbursement(order_by: {date_of_expense: asc}) {
      ${Reimbursement.attributes}
    }
  }

''';
String getAllHRReimbursement = '''
  query Reimbursement {
    reimbursement(order_by: {date_of_expense: asc}) {
      ${Reimbursement.hRAttributes}
    }
  }

''';
