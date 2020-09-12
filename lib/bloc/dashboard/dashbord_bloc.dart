import 'package:bloc/bloc.dart';
import 'package:corporate_expense_manager/bloc/dashboard/dashbord_event.dart';
import 'package:corporate_expense_manager/bloc/dashboard/dashbord_state.dart';
import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';
import 'package:corporate_expense_manager/models/reimbursement/reimbursement_repo.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  ReimbursementRepo _reimbursementRepo;

  DashboardBloc() {
    _reimbursementRepo = ReimbursementRepo.instance;
  }

  @override
  DashboardState get initialState => InitState();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is LoadReimbursements) {
      yield LoadingReimbursement();
      List<Reimbursement> reimbursements = await _reimbursementRepo.loadAll();
      yield LoadedReimbursement(reimbursements);
    }
  }
}
