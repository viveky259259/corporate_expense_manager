enum ReimbursementStatus {
  not_processed,
  processed,
  completed,
  declined,
  under_review,
}

class ReimbursementStatusHelper {
  static ReimbursementStatus getStatusFromString(String status) {
    switch (status) {
      case "not_processed":
        return ReimbursementStatus.not_processed;
        break;
      case "processed":
        return ReimbursementStatus.processed;
        break;
      case "completed":
        return ReimbursementStatus.completed;
        break;
      case "declined":
        return ReimbursementStatus.declined;
        break;
      case "under_review":
        return ReimbursementStatus.under_review;
        break;
      default:
        return ReimbursementStatus.not_processed;
    }
  }

  static String getStringFromStatusToShow(ReimbursementStatus status) {
    switch (status) {
      case ReimbursementStatus.not_processed:
        return 'Not Processed';
        break;
      case ReimbursementStatus.processed:
        return 'Processed';
        break;
      case ReimbursementStatus.completed:
        return 'Completed';
        break;
      case ReimbursementStatus.declined:
        return 'Declined';
        break;
      case ReimbursementStatus.under_review:
        return 'Under Review';
        break;

      default:
        return 'Not Processed';
    }
  }

  static String getStringFromStatus(ReimbursementStatus status) {
    switch (status) {
      case ReimbursementStatus.not_processed:
        return 'not_processed';
        break;
      case ReimbursementStatus.processed:
        return 'processed';
        break;
      case ReimbursementStatus.completed:
        return 'completed';
        break;
      case ReimbursementStatus.declined:
        return 'declined';
        break;
      case ReimbursementStatus.under_review:
        return 'under_review';
        break;

      default:
        return 'not_processed';
    }
  }

  static int getIndexOfStatus(ReimbursementStatus status) {
    switch (status) {
      case ReimbursementStatus.not_processed:
        return 1;
        break;
      case ReimbursementStatus.processed:
        return 2;
        break;
      case ReimbursementStatus.under_review:
        return 3;
        break;
      case ReimbursementStatus.completed:
        return 4;
        break;
      case ReimbursementStatus.declined:
        return 4;
        break;

      default:
        return 1;
    }
  }

  static List<ReimbursementStatus> getAll() {
    return [
      ReimbursementStatus.not_processed,
      ReimbursementStatus.processed,
      ReimbursementStatus.under_review,
      ReimbursementStatus.completed,
    ];
  }
}
