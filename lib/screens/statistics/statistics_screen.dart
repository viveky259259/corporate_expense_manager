import 'package:corporate_expense_manager/bloc/statistics/statistics_bloc.dart';
import 'package:corporate_expense_manager/bloc/statistics/statistics_event.dart';
import 'package:corporate_expense_manager/bloc/statistics/statistics_state.dart';
import 'package:corporate_expense_manager/component/atoms/circular_progress_bar.dart';
import 'package:corporate_expense_manager/screens/statistics/staticstics/allstat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<StatisticsBloc>(context).add(GetAllStats());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
      ),
      body: BlocBuilder<StatisticsBloc, StatisticsState>(
        bloc: BlocProvider.of<StatisticsBloc>(context),
        builder: (context, state) {
          if (state is Loading) {
            return CircularProgressBarAtom();
          } else if (state is LoadedAllStats) {
            return AllStatWidget(state.staticss);
          } else
            return CircularProgressBarAtom();
        },
      ),
    );
  }
}
