import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';
import 'package:corporate_expense_manager/models/reimbursement/status/reimbursement_status.dart';

class DashboardEvent {}

class LoadReimbursementsForMe extends DashboardEvent {}

class LoadReimbursementsForOthers extends DashboardEvent {}

class UpdateReimbursement extends DashboardEvent {
  final Reimbursement reimbursement;
  final ReimbursementStatus newStatus;

  UpdateReimbursement(this.reimbursement, this.newStatus);
}
