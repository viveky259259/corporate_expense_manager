import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';

String getAllReimbursement = '''
  query Reimbursement {
    reimbursement {
      ${Reimbursement.attributes}
    }
  }

''';
String getAllHRReimbursement = '''
  query Reimbursement {
    reimbursement {
      ${Reimbursement.hRAttributes}
    }
  }

''';

String updateStatus= ''' 
mutation MyMutation(\$status: String!, \$id: uuid!) {
  update_reimbursement(where: {id: {_eq: \$id}}, _set: {status: \$status}) {
    affected_rows
  }
}

''';

