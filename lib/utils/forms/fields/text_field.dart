import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_app/constants/form_field_constants.dart' as field_type;
import 'package:my_budget_app/utils/forms/validators/validator_factory.dart' as validator_factory;

class ExtendedFormTextField extends StatefulWidget
{
  final String label;
  final TextEditingController controller;
  final String type;

  String? _error;
  String? _value;

  ExtendedFormTextField({
    Key? key,
    required this.type,
    required this.label,
    required this.controller
  }) : super(key: key) {
    _error = null;
    _value = null;
  }

  @override
  State<StatefulWidget> createState() {
    return _ExtendedFormTextFieldState();
  }

  bool isValid()
  {
    var error = _error ?? '';
    var value = _value;

    if (value == null) {
      return false;
    }

    return error.isEmpty && value.isNotEmpty;
  }

  String? getValue()
  {
    return _value;
  }

  void setValue(String value)
  {
    _value = value;
    controller.text = value;
  }
}

class _ExtendedFormTextFieldState extends State<ExtendedFormTextField>
{
  _ExtendedFormTextFieldState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: TextFormField(
        obscureText: (widget.type.contains('PASSWORD')),
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: widget.label,
            errorText: widget._error,
            icon: IconButton(
              icon: Icon(buildIcon()),
              onPressed: () async {
                if (field_type.BIRTHDATE == widget.type) {
                  await handleDateSelection(widget, context);
                }
              },
            )
        ),
        onChanged: (input) {
          setState(() {
            widget._error = validate(input);
            widget._value = input;
          });
        },
        controller: widget.controller,
      ),
    );
  }

  IconData buildIcon()
  {
    switch (widget.type) {
      case field_type.BIRTHDATE: return Icons.calendar_view_month;
      case field_type.EMAIL: return Icons.email;
      case field_type.FIRSTNAME: return Icons.perm_identity;
      case field_type.LASTNAME: return Icons.perm_identity;
      case field_type.LOGIN_PASSWORD: return Icons.lock;
      case field_type.PASSWORD: return Icons.lock;
      default: return Icons.arrow_right_sharp;
    }
  }

  String? validate(String textInput)
  {
    var isFieldEmpty = validator_factory.isEmpty(textInput);
    if (isFieldEmpty != null) {
      return isFieldEmpty;
    }

    switch (widget.type) {
      case field_type.BIRTHDATE:
        return validator_factory.isValidBirthDate(textInput);
      case field_type.EMAIL:
        return validator_factory.isValidEmail(textInput);
      case field_type.PASSWORD:
        return validator_factory.isValidPassword(textInput);
      default:
        return null;
    }
  }
}

Future<void> handleDateSelection(ExtendedFormTextField widget, BuildContext context) async {
  var initialDate = DateTime.now();
  if (validator_factory.isValidBirthDate(widget._value ?? '') == null) {
    initialDate = DateFormat('yyyy-MM-dd').parse(widget._value ?? '');
  }

  var selectedDate = await showDatePicker(
      firstDate: DateTime(1900, 1, 1),
      initialDate: initialDate,
      lastDate: DateTime.now(),
      context: context
  );

  var datetime = selectedDate;
  if (datetime == null) {
    return;
  }

  var date =  DateFormat('yyyy-MM-dd').format(datetime);
  widget._value = date;
  widget.controller.text = date;
}