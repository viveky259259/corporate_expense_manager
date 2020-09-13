import 'package:corporate_expense_manager/models/reimbursement/reimbursement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewReimbursement extends StatefulWidget {
  final Function(Reimbursement) onSubmit;

  NewReimbursement(this.onSubmit);

  @override
  _NewReimbursementState createState() => _NewReimbursementState();
}

class _NewReimbursementState extends State<NewReimbursement> {
  TextEditingController _amountController;

  TextEditingController _dateOfExpenseController;

  TextEditingController _titleController;

  TextEditingController _descriptionController;

  FocusNode _amountFocus;
  FocusNode _dateOfExpenseFocus;

  FocusNode _titleFocus;
  FocusNode _descriptionFocus;

  bool paidInCash = false;

  DateTime expenseDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _amountController = TextEditingController();
    _dateOfExpenseController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add new entry for reimbursement',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
            controller: _titleController,
            focusNode: _titleFocus,
            decoration:
                InputDecoration(labelText: 'Title', hintText: 'eg. Uber cab'),
          ),
          TextField(
            controller: _descriptionController,
            focusNode: _descriptionFocus,
            decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Went to office by Uber cab'),
          ),
          TextField(
            controller: _amountController,
            focusNode: _amountFocus,
            decoration: InputDecoration(labelText: 'Amount', hintText: '120'),
          ),
          GestureDetector(
            onTap: () async {
              DateTime selectedDate = await DatePicker.showDatePicker(
                context,
                currentTime: DateTime.now(),
              );
              bool validated = selectedDate != null;
              if (validated) {
                expenseDate = selectedDate;
                _dateOfExpenseController.text =
                    DateFormat.yMMMMd('en_US').format(selectedDate);
              }
            },
            child: AbsorbPointer(
              absorbing: true,
              child: TextField(
                controller: _dateOfExpenseController,
                focusNode: _dateOfExpenseFocus,
                decoration: InputDecoration(
                    labelText: 'Date of expense', hintText: '12/1/2020'),
              ),
            ),
          ),
          Row(
            children: [
              Text('Paid in Cash?'),
              SizedBox(
                width: 16,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      paidInCash = !paidInCash;
                    });
                  },
                  icon: Icon(
                    paidInCash
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                  )),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              padding: EdgeInsets.all(16),
              onPressed: () {
                if (_titleController.text.isEmpty) {
                  return;
                } else if (_descriptionController.text.isEmpty) {
                  return;
                } else if (_amountController.text.isEmpty ||
                    int.tryParse(_amountController.text) == null) {
                  return;
                } else if (_dateOfExpenseController.text.isEmpty) {
                  return;
                }
                Reimbursement reimbursement = Reimbursement(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    amount: int.parse(_amountController.text),
                    paidInCash: paidInCash,
                    dateOfExpense: expenseDate);
                widget.onSubmit(reimbursement);
                Get.back(result: reimbursement);
              },
              child: Text('Add'),
            ),
          )
        ],
      ),
    );
  }
}
