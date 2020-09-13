import 'package:corporate_expense_manager/models/statistics/all_statistics.dart';

class StatisticsState {}

class InitState extends StatisticsState {}

class Loading extends StatisticsState {}

class LoadedAllStats extends StatisticsState {
  AllStaticss staticss;

  LoadedAllStats(this.staticss);
}
