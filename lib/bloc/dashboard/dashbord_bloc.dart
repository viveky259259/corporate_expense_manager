import 'package:bloc/bloc.dart';
import 'package:corporate_expense_manager/bloc/dashboard/dashbord_event.dart';
import 'package:corporate_expense_manager/bloc/dashboard/dashbord_state.dart';
import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';
import 'package:corporate_expense_manager/models/reimbursement/reimbursement_repo.dart';
import 'package:corporate_expense_manager/models/reimbursement/status/reimbursement_status.dart';
import 'package:corporate_expense_manager/models/user/user.dart';
import 'package:corporate_expense_manager/models/user/user_local.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  ReimbursementRepo _reimbursementRepo;

  DashboardBloc() {
    _reimbursementRepo = ReimbursementRepo.instance;
  }

  @override
  DashboardState get initialState => InitState();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is LoadReimbursementsForMe) {
      yield LoadingReimbursement();
      List<Reimbursement> reimbursements =
          await _reimbursementRepo.loadAllForMe();
      yield LoadedReimbursement(reimbursements);
    } else if (event is LoadReimbursementsForOthers) {
      yield LoadingReimbursement();
      List<Reimbursement> reimbursements =
          await _reimbursementRepo.loadAllForOthers();
      User user = await UserLocal.instance.getLocalUser();
      reimbursements.removeWhere((each) => each.user.userId == user.userId);
      yield LoadedReimbursementForOthers(reimbursements);
    } else if (event is UpdateReimbursement) {
      yield LoadingReimbursement();
      await _reimbursementRepo.updateStatus(
          ReimbursementStatusHelper.getStringFromStatus(event.newStatus),
          event.reimbursement.id);
      this.add(LoadReimbursementsForOthers());
    }
  }
}
