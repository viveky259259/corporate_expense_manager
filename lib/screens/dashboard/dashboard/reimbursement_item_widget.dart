import 'package:corporate_expense_manager/bloc/dashboard/dashbord_bloc.dart';
import 'package:corporate_expense_manager/bloc/dashboard/dashbord_event.dart';
import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';
import 'package:corporate_expense_manager/models/reimbursement/status/reimbursement_status.dart';
import 'package:corporate_expense_manager/models/user/user_local.dart';
import 'package:corporate_expense_manager/models/user/user_types.dart';
import 'package:corporate_expense_manager/screens/dashboard/dashboard/reimbursement_status_widget.dart';
import 'package:corporate_expense_manager/services/date_time_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ReimbursementItemWidget extends StatelessWidget {
  final Reimbursement reimbursement;
  final bool others;

  ReimbursementItemWidget(
    this.reimbursement, {
    this.others = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: reimbursement.reimbursementStatus == ReimbursementStatus.completed
          ? Colors.green
          : reimbursement.reimbursementStatus == ReimbursementStatus.completed
              ? Colors.red
              : Colors.transparent,
      margin: EdgeInsets.all(4),
      child: Card(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onLongPress: () async {
                    UserLocal.instance.getLocalUser().then((user) {
                      if (UserTypeHelper.getTypeFromString(user.type) !=
                          UserType.employee) {
                        if (UserTypeHelper.getTypeFromString(user.type) ==
                                UserType.human_resource &&
                            ReimbursementStatusHelper.getIndexOfStatus(
                                    reimbursement.reimbursementStatus) <
                                3) {
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8))),
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Update status to Processed',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: RaisedButton(
                                          padding: EdgeInsets.all(16),
                                          onPressed: () {
                                            Get.back(result: true);
                                          },
                                          child: Text('No'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: RaisedButton(
                                          padding: EdgeInsets.all(16),
                                          onPressed: () {
                                            Get.back(result: true);
                                          },
                                          child: Text('Yes'),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }).then((selection) {
                            BlocProvider.of<DashboardBloc>(context).add(
                                UpdateReimbursement(reimbursement,
                                    ReimbursementStatus.processed));
                          });
                        }
                      }
                    });
                  },
                  leading: others
                      ? CircleAvatar(
                          child: Text(
                            [
                              reimbursement.user.firstName,
                              reimbursement.user.lastName
                            ].join('\n'),
                            style: TextStyle(fontSize: 10),
                          ),
                        )
                      : null,
                  title: Text(reimbursement.title),
                  subtitle: Text(
                    DateTimeService.dateInString(
                        reimbursement.dateOfExpense.toLocal()),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    color: Colors.deepPurpleAccent,
                    child: Text(
                      '\u{20B9} ${reimbursement.amount}',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 8),
                  child: ReimbursementStatusWidget(
                      reimbursement.reimbursementStatus),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
