String getAllStats = '''
query Stats {
  reimbursement_aggregate {
    aggregate {
      count(columns: title)
      max {
        amount
      }
       sum {
        amount
      }
    }
  }
}

''';
