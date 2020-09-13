import 'package:corporate_expense_manager/models/reimbursement/status/reimbursement_status.dart';
import 'package:flutter/material.dart';

class ReimbursementStatusWidget extends StatelessWidget {
  final ReimbursementStatus reimbursementStatus;

  ReimbursementStatusWidget(this.reimbursementStatus);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: ReimbursementStatusHelper.getAll().map((each) {
        if (reimbursementStatus == each) {
          return Column(
            children: [
              Text(ReimbursementStatusHelper.getStringFromStatusToShow(
                  reimbursementStatus)),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 10,
                width: 10,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: ReimbursementStatusHelper.getIndexOfStatus(each) >
                            ReimbursementStatusHelper.getIndexOfStatus(
                                reimbursementStatus)
                        ? Colors.grey
                        : Colors.green,
                    shape: BoxShape.circle),
              )
            ],
          );
        } else {
          return Container(
            height: 10,
            width: 10,
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                color: ReimbursementStatusHelper.getIndexOfStatus(each) >
                        ReimbursementStatusHelper.getIndexOfStatus(
                            reimbursementStatus)
                    ? Colors.grey
                    : Colors.green,
                shape: BoxShape.circle),
          );
        }
      }).toList(),
    );
  }
}
