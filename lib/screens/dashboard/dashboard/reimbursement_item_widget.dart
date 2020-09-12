import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';
import 'package:corporate_expense_manager/services/date_time_service.dart';
import 'package:flutter/material.dart';

class ReimbursementItemWidget extends StatelessWidget {
  final Reimbursement reimbursement;

  ReimbursementItemWidget(this.reimbursement);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(reimbursement.title),
      subtitle: Text(
          DateTimeService.dateInString(reimbursement.dateOfExpense.toLocal())),
    );
  }
}
