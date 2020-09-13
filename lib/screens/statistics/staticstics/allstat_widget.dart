import 'package:corporate_expense_manager/models/statistics/all_statistics.dart';
import 'package:flutter/material.dart';

class AllStatWidget extends StatelessWidget {
  final AllStaticss staticss;

  AllStatWidget(this.staticss);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All reimbursements: ${staticss.totalReimburseCount}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Max amount reimbursed: \u{20B9} ${staticss.maxAmount}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Total amount reimbursed: \u{20B9} ${staticss.totalAmountReimbursed}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
