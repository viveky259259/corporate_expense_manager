import 'package:corporate_expense_manager/bloc/dashboard/dashbord_bloc.dart';
import 'package:corporate_expense_manager/bloc/dashboard/dashbord_event.dart';
import 'package:corporate_expense_manager/bloc/dashboard/dashbord_state.dart';
import 'package:corporate_expense_manager/component/atoms/circular_progress_bar.dart';
import 'package:corporate_expense_manager/screens/dashboard/dashboard/reimbursement_wapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DashboardBloc>(context)..add(LoadReimbursements());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        bloc: BlocProvider.of<DashboardBloc>(context),
        builder: (context, state) {
          if (state is LoadingReimbursement)
            return CircularProgressBarAtom();
          else if (state is LoadedReimbursement) {
            return ReimbursementWrapper(state.reimbursements);
          } else if (state is LoadinFailedReimbursement)
            return Text('Wattt');
          else
            return CircularProgressBarAtom();
        },
      ),
    );
  }
}
