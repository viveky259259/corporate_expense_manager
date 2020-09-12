/*

mutation MyMutation($reimbursement: reimbursement_insert_input!) {
  insert_reimbursement_one(object: $reimbursement) {
    amount
    attachment
    date_of_expense
    description
    paid_in_cash
    title
    user_id
    attachments {
      attachment_type
      attachment_url
    }
  }
}

{
  "reimbursement":{
    "amount": 450,
    "attachment": "Beer",
    "date_of_expense": "now()",
    "description": "went to bar",
    "paid_in_cash": false,
    "title": "dad",
    "attachments": {
      "data": {
        "attachment_type": "Dad",
        "attachment_url": "dad"
      }
    }
  }
}
 */

class Attachment {
  String _attachmentUrl;
  String _attachmentType;

  static String attributes='''
    attachment_url
    attachment_type
    
  ''';
  Attachment({String attachmentUrl, String attachmentType}) {
    this._attachmentUrl = attachmentUrl;
    this._attachmentType = attachmentType;
  }

  String get attachmentUrl => _attachmentUrl;
  set attachmentUrl(String attachmentUrl) => _attachmentUrl = attachmentUrl;
  String get attachmentType => _attachmentType;
  set attachmentType(String attachmentType) => _attachmentType = attachmentType;

  Attachment.fromJson(Map<String, dynamic> json) {
    _attachmentUrl = json['attachment_url'];
    _attachmentType = json['attachment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attachment_url'] = this._attachmentUrl;
    data['attachment_type'] = this._attachmentType;
    return data;
  }
}