import 'package:flutter/material.dart';
import 'package:my_budget_app/constants/form_field.constants.dart' as field_type;
import 'package:my_budget_app/utils/forms/validators/validator.factory.dart' as validator_factory;

class FormTextField extends StatefulWidget
{
  final String label;
  final TextEditingController controller;
  final String type;

  String? _error;
  String? _value;

  FormTextField({
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
    return _FormTextFieldState();
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
}

class _FormTextFieldState extends State<FormTextField>
{
  _FormTextFieldState();

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
              onPressed: () {},
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
      case field_type.EMAIL: return Icons.email;
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
      case field_type.EMAIL:
        return validator_factory.isValidEmail(textInput);
      case field_type.PASSWORD:
        return validator_factory.isValidPassword(textInput);
      default:
        return null;
    }
  }
}