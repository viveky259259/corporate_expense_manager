import 'package:corporate_expense_manager/bloc/dashboard/dashbord_bloc.dart';
import 'package:corporate_expense_manager/bloc/login/login_bloc.dart';
import 'package:corporate_expense_manager/bloc/statistics/statistics_bloc.dart';
import 'package:corporate_expense_manager/screens/app_loading/app_loading.dart';
import 'package:corporate_expense_manager/services/hive_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDbService.instance.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (_) => LoginBloc(),
          ),
          BlocProvider<DashboardBloc>(
            create: (_) => DashboardBloc(),
          ),
          BlocProvider<StatisticsBloc>(
            create: (_) => StatisticsBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Rirev Expenses',
          navigatorKey: Get.key,
          home: AppLoadingScreen(),
        ));
  }
}
