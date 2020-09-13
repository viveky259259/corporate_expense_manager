String addReimbursement = '''
mutation AddReimbursement(\$reimbursement: reimbursement_insert_input!) {
  insert_reimbursement_one(object: \$reimbursement) {
    amount
    attachment
    status
    paid_in_cash
    title
    user_id
  }
}

''';
String updateStatus = ''' 
mutation MyMutation(\$status: String!, \$id: uuid!) {
  update_reimbursement(where: {id: {_eq: \$id}}, _set: {status: \$status}) {
    affected_rows
  }
}

''';
