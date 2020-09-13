import 'package:corporate_expense_manager/bloc/dashboard/dashbord_bloc.dart';
import 'package:corporate_expense_manager/bloc/dashboard/dashbord_event.dart';
import 'package:corporate_expense_manager/bloc/dashboard/dashbord_state.dart';
import 'package:corporate_expense_manager/component/atoms/circular_progress_bar.dart';
import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';
import 'package:corporate_expense_manager/models/user/user.dart';
import 'package:corporate_expense_manager/models/user/user_local.dart';
import 'package:corporate_expense_manager/models/user/user_types.dart';
import 'package:corporate_expense_manager/screens/dashboard/dashboard/new_reimbursement.dart';
import 'package:corporate_expense_manager/screens/dashboard/dashboard/reimbursement_wapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool othersActive = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DashboardBloc>(context)..add(LoadReimbursementsForMe());
    });
  }

  void addNewReimbursement(Reimbursement reimbursement) {
    print(reimbursement);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          FutureBuilder<User>(
            future: UserLocal.instance.getLocalUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return SizedBox();
              else if (UserTypeHelper.getTypeFromString(snapshot.data.type) ==
                  UserType.human_resource) {
                return IconButton(
                  icon: Icon(Icons.swap_horiz),
                  onPressed: () {
                    if (othersActive) {
                      BlocProvider.of<DashboardBloc>(context)
                          .add(LoadReimbursementsForMe());
                    } else {
                      BlocProvider.of<DashboardBloc>(context)
                          .add(LoadReimbursementsForOthers());
                    }
                    othersActive = !othersActive;
                  },
                );
              } else
                return SizedBox();
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  builder: (context) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: NewReimbursement(addNewReimbursement),
                      ));
            },
          )
        ],
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        bloc: BlocProvider.of<DashboardBloc>(context),
        builder: (context, state) {
          if (state is LoadingReimbursement)
            return CircularProgressBarAtom();
          else if (state is LoadedReimbursement) {
            if (state.reimbursements == null || state.reimbursements.isEmpty)
              return Center(
                child: Text('Nothing to show here'),
              );
            return ReimbursementWrapper(state.reimbursements);
          } else if (state is LoadedReimbursementForOthers) {
            if (state.reimbursements == null || state.reimbursements.isEmpty)
              return Center(
                child: Text('Nothing to show here'),
              );
            return ReimbursementWrapper(
              state.reimbursements,
              others: true,
            );
          } else if (state is LoadinFailedReimbursement)
            return Card(
              color: Colors.red.shade300,
              child: Text('Failure Detected!'),
            );
          else
            return CircularProgressBarAtom();
        },
      ),
    );
  }
}
