import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget
{
  final String label;
  final FormFieldValidator<String>? validator;

  const FormTextField({
    Key? key,
    required this.label,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        validator: validator
      ),
    );
  }
}