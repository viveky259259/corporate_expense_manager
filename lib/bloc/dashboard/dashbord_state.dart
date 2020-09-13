import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';

class DashboardState {}

class InitState extends DashboardState {}

class LoadingReimbursement extends DashboardState {}

class LoadedReimbursement extends DashboardState {
  final List<Reimbursement> reimbursements;

  LoadedReimbursement(this.reimbursements);
}

class LoadedReimbursementForOthers extends DashboardState {
  final List<Reimbursement> reimbursements;

  LoadedReimbursementForOthers(this.reimbursements);
}

class LoadinFailedReimbursement extends DashboardState {}
