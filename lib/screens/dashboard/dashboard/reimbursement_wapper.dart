import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';
import 'package:corporate_expense_manager/screens/dashboard/dashboard/reimbursement_item_widget.dart';
import 'package:flutter/material.dart';

class ReimbursementWrapper extends StatelessWidget {
  final List<Reimbursement> reimbursements;
  final bool others;

  ReimbursementWrapper(this.reimbursements, {this.others = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ReimbursementItemWidget(
          reimbursements[index],
          others: others,
        );
      },
      itemCount: reimbursements.length,
      shrinkWrap: true,
    );
  }
}
