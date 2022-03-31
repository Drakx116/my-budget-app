import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget
{
  final String label;
  final TextEditingController controller;
  final IconData icon;

  final FormFieldValidator<String>? validator;

  const FormTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.icon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: TextFormField(
        obscureText: (Icons.lock == icon),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          icon: IconButton(
            icon: Icon(icon), onPressed: () {  },
          )
        ),
        validator: validator,
        controller: controller,
      ),
    );
  }
}