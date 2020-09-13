import 'package:bloc/bloc.dart';
import 'package:corporate_expense_manager/bloc/statistics/statistics_event.dart';
import 'package:corporate_expense_manager/bloc/statistics/statistics_state.dart';
import 'package:corporate_expense_manager/models/statistics/all_statistics.dart';
import 'package:corporate_expense_manager/models/statistics/statistics_repo.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsRepo _repo;

  @override
  StatisticsState get initialState => InitState();

  StatisticsBloc() {
    _repo = StatisticsRepo.instance;
  }

  @override
  Stream<StatisticsState> mapEventToState(StatisticsEvent event) async* {
    if (event is GetAllStats) {
      yield Loading();
      AllStaticss staticss = await _repo.getAll();
      yield LoadedAllStats(staticss);
    }
  }
}
