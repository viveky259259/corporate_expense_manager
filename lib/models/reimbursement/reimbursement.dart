//class Reimbursement {
//  List<Reimbursement> _reimbursement;
//
//  Reimbursement({List<Reimbursement> reimbursement}) {
//    this._reimbursement = reimbursement;
//  }
//
//  List<Reimbursement> get reimbursement => _reimbursement;
//  set reimbursement(List<Reimbursement> reimbursement) =>
//      _reimbursement = reimbursement;
//
//  Reimbursement.fromJson(Map<String, dynamic> json) {
//    if (json['reimbursement'] != null) {
//      _reimbursement = new List<Reimbursement>();
//      json['reimbursement'].forEach((v) {
//        _reimbursement.add(new Reimbursement.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this._reimbursement != null) {
//      data['reimbursement'] =
//          this._reimbursement.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//}

import 'package:corporate_expense_manager/models/attachment/attachment.dart';
import 'package:corporate_expense_manager/services/date_time_service.dart';

class Reimbursement {
  int _amount;
  List<Attachment> _attachments;
  DateTime _dateOfExpense;
  String _description;
  bool _paidInCash;
  String _title;
  static String attributes = '''
    amount
    attachments {
      ${Attachment.attributes}
    }
    date_of_expense
    description
    paid_in_cash
    title

''';

  Reimbursement(
      {int amount,
      List<Attachment> attachments,
      DateTime dateOfExpense,
      String description,
      bool paidInCash,
      String title}) {
    this._amount = amount;
    this._attachments = attachments;
    this._dateOfExpense = dateOfExpense;
    this._description = description;
    this._paidInCash = paidInCash;
    this._title = title;
  }

  int get amount => _amount;

  set amount(int amount) => _amount = amount;

  List<Attachment> get attachments => _attachments;

  set attachments(List<Attachment> attachments) => _attachments = attachments;

  DateTime get dateOfExpense => _dateOfExpense;

  set dateOfExpense(DateTime dateOfExpense) => _dateOfExpense = dateOfExpense;

  String get description => _description;

  set description(String description) => _description = description;

  bool get paidInCash => _paidInCash;

  set paidInCash(bool paidInCash) => _paidInCash = paidInCash;

  String get title => _title;

  set title(String title) => _title = title;

  Reimbursement.fromJson(Map<String, dynamic> json) {
    _amount = json['amount'];
    if (json['attachments'] != null) {
      _attachments = new List<Attachment>();
      json['attachments'].forEach((v) {
        _attachments.add(new Attachment.fromJson(v));
      });
    }
    _dateOfExpense = DateTimeService.fromString(json['date_of_expense']);
    _description = json['description'];
    _paidInCash = json['paid_in_cash'];
    _title = json['title'];
  }

  static List<Reimbursement> fromList(List<dynamic> jsonList) {
    return jsonList.map((json) {
      return Reimbursement.fromJson(json);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this._amount;
    if (this._attachments != null) {
      data['attachments'] = this._attachments.map((v) => v.toJson()).toList();
    }
    data['date_of_expense'] = this._dateOfExpense.toString();
    data['description'] = this._description;
    data['paid_in_cash'] = this._paidInCash;
    data['title'] = this._title;
    return data;
  }
}
